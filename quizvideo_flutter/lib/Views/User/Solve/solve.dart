import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/Database/question_controller.dart';
import 'package:quizvideo_flutter/Controllers/Database/quiz_controller.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/User/Solve/Widgets/question_card.dart';
import 'package:quizvideo_flutter/Views/Widgets/center_text_message.dart';
import 'package:quizvideo_flutter/Views/Widgets/loading.dart';

import 'Widgets/app_bar.dart';
import 'Widgets/next_finish_button.dart';
import 'Widgets/option.dart';

class SolvePage extends StatefulWidget {
  const SolvePage({
    super.key,
    this.category,
    this.quiz,
    this.competitionStatus = false,
    this.competition,
    this.questions,
  });

  final Category? category;
  final Quiz? quiz;
  final bool competitionStatus;
  final Competition? competition;
  final List<Question>? questions;

  @override
  State<SolvePage> createState() => _SolvePageState();
}

class _SolvePageState extends State<SolvePage> with StateTools {
  bool get isQuiz => widget.quiz != null;
  final qc = QuizDbController();
  final quesc = QuestionDbController();
  (List<Question>?, DbException?) data = (null, null);
  //StreamSubscription? subscription;

  Timer? timer;

  ///Online olacak quiz için init alanı
  competitionInit(BuildContext context) async {
    if (widget.competition == null) return;
    //await gc.streamInit();
    await Future.delayed(const Duration(seconds: 2));
    await gc.streamConnect();

    listenStart(context);

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (time) {
        print("PING");
        gc.client.competition.sendStreamMessage(
          StreamAction(
            action: "ping",
            data: jsonEncode(sc.competition.value!.toJson()),
          ),
        );
      },
    );

    await gc.client.competition.sendStreamMessage(widget.competition!);
  }

  StreamSubscription? subs;

  listenStart(BuildContext context) async {
    subs = gc.competitionStream!.listen(
      (message) {
        if (message is StreamAction) {
          if (message.action == "nextQuestion") {
            sc.next(corWrongCheck: true);
          } else if (message.action == "endCompetition") {
            sc.finish(context, corWrongCheck: true);
          } else if (message.action == "otherAnswer") {
            Map<String, dynamic> data = jsonDecode(message.data);

            data.forEach(
              (key, value) {
                if (key != ac.userInfo!.id.toString()) {
                  sc.otherAnswer.value = value;
                  return;
                }
              },
            );
          } else if (message.action == "competition_dispose") {
            sc.finish(context, corWrongCheck: true, comDispose: true);
          }
        }
      },
    );

    /*
    await for (var event in gc.client.competition.stream.asBroadcastStream()) {
      Logger().i(event.toJson());
      print(event.toJson());
    }
     */
  }

  @override
  void initState() {
    // TODO: implement initState
    sc.reset();
    super.initState();
    typeInit();
  }

  @override
  void dispose() {
    timer?.cancel();
    subs?.cancel();
    if (widget.competition != null) {
      gc.streamDisconnect();
    }

    super.dispose();
  }

  getQuestions(BuildContext context) async {
    if (widget.quiz == null && widget.category == null) return;
    typeInit();

    data = await run(() async {
      (List<Question>?, DbException?) result = (null, null);

      if (widget.competition != null && widget.category?.id != null) {
        result = (widget.questions, null);
      } else {
        result = await quesc.getAll(
          quizId: widget.quiz?.id,
          categoryId: widget.category?.id,
        );
      }

      if (result.$1 != null && result.$2 == null) {
        sc.questionList.clear();
        sc.questionList.addAll(result.$1!);
        Duration? duration;
        if (sc.type == QuizResultType.quiz) {
          if (widget.quiz!.time != null && widget.quiz!.time! > 0) {
            duration = Duration(seconds: widget.quiz!.time!);
          }
        }
        sc.competition.value = widget.competition;
        await competitionInit(context);
        sc.init(context, dur: duration);
        //await Future.delayed(Duration(milliseconds: 200));
      }
      return result;
    });
  }

  void typeInit() {
    if (widget.quiz?.id != null) {
      sc.typeId = widget.quiz!.id!;
    } else if (widget.category?.id != null) {
      sc.type = QuizResultType.category;
      sc.typeId = widget.category!.id!;
    } else {
      throw DbException(message: "Quiz or Category not found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColor,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SolvePageAppBar(),
              Expanded(
                child: FutureBuilder(
                  future: getQuestions(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loading();
                    }

                    if (snapshot.hasError) {
                      return Builder(builder: (ctx) {
                        print(snapshot.stackTrace);
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              CenterTextMessage(snapshot.error.toString()),
                              CenterTextMessage(
                                snapshot.stackTrace.toString(),
                                fontSize: 14,
                              ),
                            ],
                          ),
                        );
                      });
                    }

                    if (data.$1 == null) {
                      return CenterTextMessage(data.$2?.message ?? "");
                    }

                    return SingleChildScrollView(
                      child: !context.isPhone
                          ? Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: QuestionCard(),
                                ),
                                20.w,
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      const Option(option: "a"),
                                      const Option(option: "b"),
                                      const Option(option: "c"),
                                      const Option(option: "d"),
                                      NextFinishButton(),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                20.h,
                                const QuestionCard(),
                                30.h,
                                const Option(option: "a"),
                                const Option(option: "b"),
                                const Option(option: "c"),
                                const Option(option: "d"),
                                Center(child: NextFinishButton()),
                              ],
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
