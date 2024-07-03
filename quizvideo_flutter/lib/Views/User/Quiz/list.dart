import 'package:flutter/material.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Controllers/Database/quiz_controller.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Widgets/center_text_message.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';
import 'package:quizvideo_flutter/Views/Widgets/loading.dart';

import 'Widgets/quiz_row.dart';

class QuizList extends StatefulWidget {
  const QuizList({super.key});

  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> with StateTools {
  final qc = QuizDbController();

  (List<Quiz>?, DbException?) quizs = (null, null);

  fetchData() async {
    quizs = await run(() => qc.getAll(limit: 10));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const GlobalAppBar(title: "Quiz List"),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loading();
                    }

                    if (snapshot.hasError) {
                      return CenterTextMessage(snapshot.error.toString());
                    }

                    if (quizs.$1 == null) {
                      return CenterTextMessage(quizs.$2?.message ?? "Error");
                    }

                    var list = (quizs.$1 ?? []);
                    return ListView.separated(
                      separatorBuilder: (context, index) => 10.h,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return QuizRow(item: list[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
