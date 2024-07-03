import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Extensions/list.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Views/User/Quiz/Widgets/quiz_row.dart';
import 'package:quizvideo_flutter/Views/User/Quiz/list.dart';

class QuizBuilder extends StatelessWidget {
  const QuizBuilder({super.key, this.quizs});
  final List<Quiz>? quizs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          10.h,
          Row(
            children: [
              Text(
                "Quizs",
                style: GoogleFonts.quicksand(
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  context.to(const QuizList());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "All Quizs",
                    style: GoogleFonts.quicksand(
                      color: primaryColor.withOpacity(.7),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          20.h,
          ...listBuilder()
        ],
      ),
    );
  }

  List<Widget> listBuilder() {
    List<Widget> list = [];
    for (Quiz el in quizs ?? []) {
      list.add(QuizRow(item: el));
    }

    return list.seperatedBy(10.h);
  }
}
