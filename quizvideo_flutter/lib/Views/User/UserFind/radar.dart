import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/User/Solve/solve.dart';
import 'package:quizvideo_flutter/Views/Widgets/center_text_message.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';

class OnlineUserFind extends StatefulWidget {
  const OnlineUserFind({
    super.key,
    this.category,
    this.quiz,
    required this.competitionStatus,
    this.competition,
  });
  final Category? category;
  final Quiz? quiz;
  final bool competitionStatus;
  final Competition? competition;

  @override
  State<OnlineUserFind> createState() => _OnlineUserFindState();
}

class _OnlineUserFindState extends State<OnlineUserFind> with StateTools {
  //late final StreamSubscription subscription;
  OnlineUser? targetUser;

  init(BuildContext context) async {
    if (widget.quiz?.id != null) {
      sc.typeId = widget.quiz!.id!;
      sc.type = QuizResultType.quiz;
    } else if (widget.category?.id != null) {
      sc.typeId = widget.category!.id!;
      sc.type = QuizResultType.category;
    } else {
      throw DbException(message: "Quiz or Category not found");
    }

    await gc.streamInit();
    await gc.streamConnect();

    listenStart();
    var thisUser = OnlineUser(
      userId: ac.sessionManager.signedInUser!.id!,
      type: sc.type,
      typeId: sc.typeId,
      user: ac.sessionManager.signedInUser!,
    );

    targetUser = await gc.client.online.addUser(thisUser);

    await gc.client.online.competition(thisUser, categoryId: widget.category?.id);
    //await gc.client.online.sendStreamMessage(thisUser);
  }

  StreamSubscription<SerializableModel>? _subscription;

  listenStart() async {
    _subscription = gc.radarStream!.listen(
      (event) {
        if (event is Competition) {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              context.toReplace(
                SolvePage(
                  quiz: widget.quiz,
                  category: widget.category,
                  competitionStatus: widget.competitionStatus,
                  competition: event,
                  questions: event.questions,
                ),
              );
            },
          );
        }
      },
    );
  }

  fetchData(BuildContext context) async {
    await run(
      () async {
        await init(context);
        return Future.value(true);
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subscription?.cancel();
    gc.streamDisconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const GlobalAppBar(title: "Online User Find"),
            Expanded(
                child: FutureBuilder(
              future: fetchData(context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Column(
                    children: [
                      CenterTextMessage(snapshot.error.toString()),
                      CenterTextMessage(snapshot.stackTrace.toString()),
                    ],
                  );
                }

                return Center(
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      "assets/images/radar.gif",
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
