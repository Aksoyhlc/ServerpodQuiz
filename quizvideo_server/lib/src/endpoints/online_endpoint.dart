import 'dart:convert';

import 'package:quizvideo_server/src/endpoints/question_endpoint.dart';
import 'package:quizvideo_server/src/generated/protocol.dart';
import 'package:quizvideo_server/src/helpers/auth_helper.dart';
import 'package:quizvideo_server/src/helpers/database_helper.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class OnlineEndpoint extends Endpoint with DatabaseHelper, AuthHelper {
  @override
  // TODO: implement requireLogin
  bool get requireLogin => true;

  @override
  Future<DbException?> streamOpened(StreamingSession session) async {
    var userId = await getUserId(session);
    session.messages.addListener(
      'user_competition_user_id_$userId',
      (message) {
        sendStreamMessage(session, message);
      },
    );
    return null;
  }

  Future<void> competition(Session session, OnlineUser message, {int? categoryId}) async {
    var competitionKey = UuidValue.fromString(Uuid().v4());

    var target = await OnlineUser.db.findFirstRow(
      session,
      where: (e) =>
          e.type.equals(message.type) &
          e.typeId.equals(
            message.typeId,
          ) &
          e.userId.notEquals(message.userId),
      orderBy: (e) => e.id,
    );

    if (target == null) return;

    await OnlineUser.db.deleteWhere(session, where: (e) => e.userId.equals(target.userId));
    await OnlineUser.db.deleteWhere(session, where: (e) => e.userId.equals(message.userId));

    List<Question>? questions;

    var cacheData = await session.caches.global.get<StreamAction>(competitionKey.uuid);

    if (cacheData != null) {
      questions = jsonDecode(cacheData.data) as List<Question>?;
    }

    if (categoryId != null && cacheData == null) {
      questions = await QuestionEndpoint().getAll(
        session,
        categoryId: categoryId,
        competition: true,
        limit: 30,
      );
      questions?.shuffle();
    }

    await session.caches.global.put(
      competitionKey.uuid,
      StreamAction(
        action: "${competitionKey.uuid}_questions",
        data: jsonEncode(questions),
      ),
    );

    Competition? compet = await Competition.db.insertRow(
      session,
      Competition(
        identifier: competitionKey,
        user1Id: message.userId,
        user2Id: target.userId,
        type: message.type,
        typeId: message.typeId,
      ),
    );

    compet = await Competition.db.findById(
      session,
      compet.id!,
      include: Competition.include(
        user1: UserInfo.include(),
        user2: UserInfo.include(),
      ),
    );
    compet!.questions = questions;

    print(compet.toJson());
    session.messages.postMessage('user_competition_user_id_${message.userId}', compet);
    session.messages.postMessage('user_competition_user_id_${target.userId}', compet);
  }

  @override
  Future<void> handleStreamMessage(StreamingSession session, SerializableModel message) {
    if (message is OnlineUser) {
      competition(session, message);
    }
    // TODO: implement handleStreamMessage
    return super.handleStreamMessage(session, message);
  }

  @override
  Future<void> streamClosed(StreamingSession session) {
    return handleAction(
      session,
      () async {
        var userId = await getUserId(session);
        await OnlineUser.db.deleteWhere(session, where: (e) => e.userId.equals(userId));
      },
    );
  }

  Future<OnlineUser?> addUser(Session session, OnlineUser row) async {
    var data = await handleAction<OnlineUser?>(
      session,
      () async {
        var userId = await getUserId(session);
        if (userId != null) {
          WhereExpressionBuilder<OnlineUserTable>? where;

          where = (e) => e.userId.notEquals(userId) & e.type.equals(row.type) & e.typeId.equals(row.typeId);

          int onlineUserCount = await OnlineUser.db.count(
            session,
            where: where,
          );
          if (onlineUserCount > 0) {
            var onlineUser = await OnlineUser.db.findFirstRow(
              session,
              where: where,
              orderBy: (e) => e.id,
            );

            if (onlineUser != null) {
              return onlineUser;
            }
          }

          var count = await OnlineUser.db.count(session, where: (e) => e.userId.equals(userId));
          if (count == 0) {
            row.createdAt = DateTime.now();
            await OnlineUser.db.insertRow(session, row);
          }
        }
        return null;
      },
    );

    if (data == null) {
      return null;
    }

    return data;
  }
}
