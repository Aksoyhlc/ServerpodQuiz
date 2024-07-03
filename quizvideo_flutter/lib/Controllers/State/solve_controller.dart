import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Controllers/Database/quiz_result_controller.dart';
import 'package:quizvideo_flutter/Controllers/State/auth_contoller.dart';
import 'package:quizvideo_flutter/Controllers/State/global_controller.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Views/User/Solve/result.dart';

class SolveController extends GetxController {
  final gc = Get.find<GlobalController>();
  final ac = Get.find<AuthContoller>();

  RxList<Question> questionList = <Question>[].obs;
  RxMap result = {}.obs;
  QuizResultType type = QuizResultType.quiz;
  int typeId = 0;

  RxInt correctCount = 0.obs;
  RxInt passedCount = 0.obs;
  RxInt wrongCount = 0.obs;
  RxInt index = (0).obs;
  Rx<Question?> question = Rx<Question?>(null);

  Rx<String> selected = "".obs;
  Rx<String> answer = "".obs;
  Rx<String> wrongValue = "".obs;
  Rx<String> otherAnswer = "".obs;
  DateTime startedAt = DateTime.now();
  int point = 0;

  Rx<Competition?> competition = Rx<Competition?>(null);
  StreamingConnectionHandler? onlineUserHandler;
  Timer? timer;

  Rx<Duration?> duration = Rx<Duration?>(null);

  getQuestion({bool direct = false}) {
    var data = questionList[index.value];
    answer.value = data.answer;
    selected.value = "";
    otherAnswer.value = "";
    answer.value = data.answer;
    question.value = data;
  }

  bool checkSelected({bool showMessage = true}) {
    return selected.value.isNotEmpty;
  }

  Future<bool> next({bool stream = false, bool corWrongCheck = false}) async {
    if (!checkSelected()) return false;

    if (stream && competition.value != null) {
      gc.client.competition.sendStreamMessage(
        StreamAction(
          action: "nextQuestion",
          data: jsonEncode(competition.value!.toJson()),
        ),
      );
      return false;
    }

    if (questionList.length - 1 < index.value + 1) {
      return false;
    }

    index.value++;

    getQuestion();
    return true;
  }

  void correctWrongCheck({bool increment = true}) {
    if (answer.value == selected.value) {
      correct();
    } else {
      wrong(selected.value);
    }
  }

  init(BuildContext context, {Duration? dur}) {
    duration.value = dur;
    if (dur != null) {
      duration.value = dur;
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          duration.value = Duration(seconds: duration.value!.inSeconds - 1);
          if (duration.value!.inSeconds <= 0) {
            timer.cancel();
            finish(context, corWrongCheck: true).then((value) => context.toReplace(const SolveResult()));
          }
        },
      );
    }
    getQuestion(direct: true);
    startedAt = DateTime.now();
  }

  Future<void> finish(
    BuildContext context, {
    bool redirect = true,
    bool corWrongCheck = false,
    bool comDispose = false,
  }) async {
    if (corWrongCheck) {
      // correctWrongCheck();
    }

    if (comDispose) {
      bottomMessage(context, "The contest was terminated because the other user's connection was lost.");
    }

    var data = QuizResult(
      typeId: typeId,
      type: type,
      correctCount: correctCount.value,
      wrongCount: wrongCount.value,
      passedCount: passedCount.value,
      point: point,
      startedAt: startedAt,
      endAt: DateTime.now(),
    );
    final qrc = QuizResultController();
    var result = await qrc.add(data);
    if (result.$2 != null || result.$1 == null) {
      bottomMessage(context, result.$2?.message);
      return;
    } else {
      if (redirect) {
        context.toReplace(const SolveResult());
      }
      return;
    }
  }

  reset() {
    index.value = 0;
    answer.value = "";
    selected.value = "";
    correctCount.value = 0;
    wrongCount.value = 0;
    passedCount.value = 0;
    point = 0;
    startedAt = DateTime.now();
    question.value = null;
    timer?.cancel();
    timer = null;
    duration.value = null;
  }

  select(String option) async {
    selected.value = option;
    correctWrongCheck();
    if (competition.value != null) {
      await gc.client.competition.sendStreamMessage(
        CompetitionAnswer(
          competition: competition.value!,
          question: question.value!,
          answer: option,
        ),
      );
      return;
    }
  }

  void correct({bool increment = true}) {
    if (increment) {
      correctCount.value++;
    }
    point += question.value!.point;
    wrongValue.value = "";
  }

  void wrong(String option, {bool increment = true}) {
    if (increment) {
      wrongCount.value++;
    }
    wrongValue.value = option;
  }

  Future<bool> otherAnswerCheck() async {
    var result = await gc.client.competition.otherAnswerCheck(AnswerCheck(
      competitionAnswer: CompetitionAnswer(
        competition: competition.value!,
        question: question.value!,
        answer: "",
      ),
      thisUser: ac.userInfo!.id!,
    ));

    return result ?? false;
  }

  void endCompetition() {
    gc.client.competition.sendStreamMessage(
      StreamAction(
        action: "endCompetition",
        data: jsonEncode(
          competition.value!.toJson(),
        ),
      ),
    );
  }
}
