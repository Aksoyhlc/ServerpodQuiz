import 'dart:convert';

import 'package:quizvideo_server/src/generated/protocol.dart';
import 'package:quizvideo_server/src/helpers/auth_helper.dart';
import 'package:quizvideo_server/src/helpers/database_helper.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class CompetitionEndpoint extends Endpoint with AuthHelper, DatabaseHelper {
  String channelName(Competition competition) => competition.identifier.toString();
  String _comAnsKey(CompetitionAnswer competition, int userId) {
    return 'competition_answer_${competition.competition.identifier}_question_${competition.question.id}_user_$userId';
  }

  Future<void> _start(StreamingSession session, Competition competition) async {
    session.messages.addListener(
      channelName(competition),
      (message) {
        sendStreamMessage(session, message);
      },
    );
  }

  @override
  Future<void> handleStreamMessage(StreamingSession session, SerializableModel message) {
    if (message is Competition) {
      _start(session, message);
    } else if (message is CompetitionAnswer) {
      answerHandler(session, message);
    } else if (message is AnswerCheck) {
      otherAnswerCheck(session, message);
    } else if (message is StreamAction) {
      if (message.action == "nextQuestion") {
        nextQuestion(message, session);
      } else if (message.action == "endCompetition") {
        endCompetition(message, session);
      } else if (message.action == "ping") {
        _ping(session, message);
      }
    }
    return super.handleStreamMessage(session, message);
  }

  void _ping(StreamingSession session, StreamAction action) async {
    final competition = Competition.fromJson(jsonDecode(action.data));
    var users = await _getUsers(session, competition);
    print("${users.$1.id}_ping");

    var thisPingKey = await _pingKey(session, competition, users.$1.id!);
    var otherPingKey = await _pingKey(session, competition, users.$2.id!);

    var data = StreamAction(action: "ping", data: DateTime.now().millisecondsSinceEpoch.toString());
    await session.caches.global.put(thisPingKey, data);

    /// Karşı tarafın son ping zamanını bulma
    var otherLastPing = await session.caches.global.get<StreamAction>(otherPingKey);

    if (otherLastPing == null) {
      return;
    }

    final time = DateTime.fromMillisecondsSinceEpoch(int.tryParse(otherLastPing.data) ?? 0);

    if (DateTime.now().difference(time).inSeconds > 5) {
      session.messages.postMessage(
        channelName(competition),
        StreamAction(
          action: "competition_dispose",
          data: jsonEncode(
            {
              "disconnectedUser": users.$2.toString(),
            },
          ),
        ),
      );
    }
  }

  Future<String> _pingKey(StreamingSession session, Competition competition, int userId) async {
    return "${channelName(competition)}_user_$userId";
  }

  void nextQuestion(StreamAction message, StreamingSession session) {
    var com = Competition.fromJson(jsonDecode(message.data));
    session.messages.postMessage(channelName(com), message);
  }

  void endCompetition(StreamAction message, StreamingSession session) {
    var com = Competition.fromJson(jsonDecode(message.data));
    session.messages.postMessage(channelName(com), message);
  }

  Future<bool?> otherAnswerCheck(Session session, AnswerCheck message) async {
    return handleAction(
      session,
      () async {
        var thisId = await getUserId(session);
        var comp = message.competitionAnswer.competition;
        int? otherId = thisId == comp.user1Id ? comp.user2Id : comp.user1Id;

        var otherAnswer = await _getAnswer(session, message.competitionAnswer, otherId);
        message.otherAnswer = otherAnswer;
        return otherAnswer != null;
      },
    );
  }

  Future<String?> _getAnswer(Session session, CompetitionAnswer competition, int? userId) async {
    var key = _comAnsKey(competition, userId!);
    var value = (await session.caches.global.get<CompetitionAnswer>(key));
    if (value != null) {
      return value.answer;
    }
    return null;
  }

  Future<(UserInfo thisUser, UserInfo otherUser)> _getUsers(Session session, Competition competition) async {
    var thisId = await getUserId(session);

    if (thisId == competition.user1Id) {
      return (competition.user1!, competition.user2!);
    } else {
      return (competition.user2!, competition.user1!);
    }
  }

  Future<void> answerHandler(StreamingSession session, CompetitionAnswer message) async {
    var userId = await getUserId(session);
    await _cacheAnswer(session, message, userId);
    var users = await _getUsers(session, message.competition);
    final UserInfo thisUser = users.$1;
    final UserInfo otherUser = users.$2;

    final thisAnswer = await _getAnswer(session, message, thisUser.id);
    final otherAnswer = await _getAnswer(session, message, otherUser.id);

    Map<String, String> object = {};

    message = _messageSet(message, userId!, thisAnswer, otherAnswer);

    if (thisAnswer != null && otherAnswer != null) {
      object[userId.toString()] = thisAnswer;
      object[otherUser.id.toString()] = otherAnswer;
      session.messages.postMessage(
        channelName(message.competition),
        StreamAction(action: "otherAnswer", data: jsonEncode(object)),
      );
    }
  }

  _cacheAnswer(StreamingSession session, CompetitionAnswer message, int? userId) async {
    await session.caches.global.put(
      _comAnsKey(message, userId!),
      message,
      lifetime: Duration(hours: 1),
    );
  }

  CompetitionAnswer _messageSet(CompetitionAnswer message, int userId, String? thisAnswer, String? otherAnswer) {
    if (message.competition.user1Id == userId) {
      message.user1Answer = thisAnswer;
      message.user2Answer = otherAnswer;
    } else {
      message.user1Answer = otherAnswer;
      message.user2Answer = thisAnswer;
    }

    message.user1IsCorrect = message.user1Answer == message.question.answer;
    message.user2IsCorrect = message.user2Answer == message.question.answer;
    return message;
  }
}
