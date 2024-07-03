import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/State/solve_controller.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';

class SolvePageAppBar extends StatelessWidget {
  const SolvePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final sc = Get.find<SolveController>();

    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                context.back();
              },
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 30,
                color: primaryColor,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                if (sc.questionList.isNotEmpty) {
                  return Text(
                    (sc.index.value + 1).toString() + " / " + sc.questionList.length.toString(),
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: darkGreyColor2,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(() {
              var dur = sc.duration.value;
              if (dur == null) return const SizedBox();
              return Container(
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: primaryColor,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Builder(
                    builder: (context) {
                      var sec = dur.inSeconds;
                      var style = GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      );
                      return Text(
                        printDuration(dur),
                        style: style,
                      );
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }
}
