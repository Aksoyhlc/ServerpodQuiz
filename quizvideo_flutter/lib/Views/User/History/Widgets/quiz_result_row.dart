import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Extensions/list.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';

class QuizResultRow extends StatelessWidget {
  const QuizResultRow({super.key, required this.result});
  final QuizResult result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          width: 2,
          color: darkGreyColor2.withOpacity(.2),
        ),
      ),
      margin: const EdgeInsets.symmetric(),
      child: Column(
        children: [
          buildRow(result.type == QuizResultType.category ? "Category:" : "Quiz:", result.typeText ?? ""),
          buildRow("Start:", result.startedAt!.toLocal().toString().split(".").first),
          buildRow("End:", result.endAt!.toLocal().toString().split(".").first),
          buildRow("Second:", (result.endAt!.difference(result.startedAt!).inSeconds).toString()),
          buildRow("Score:", result.point.toString()),
          10.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildContainer(
                color: greenColor2,
                data: result.correctCount.toString(),
                icon: Icons.check_circle_outline,
              ),
              buildContainer(
                color: redColor,
                data: result.wrongCount.toString(),
                icon: Icons.close,
              ),
              buildContainer(
                color: blueColor,
                data: result.point.toString(),
                icon: Icons.score_outlined,
              ),
            ].seperatedBy(10.h),
          ),
        ].seperatedBy(7.h),
      ),
    );
  }

  Row buildRow(String key, String value) {
    return Row(
      children: [
        Text(
          key,
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: darkGreyColor2,
            letterSpacing: 1,
          ),
        ),
        10.w,
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.quicksand(
              color: darkGreyColor2,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Container buildContainer({
    required Color color,
    required IconData icon,
    required String data,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          100,
        ),
      ),
      constraints: const BoxConstraints(minWidth: 90),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: whiteColor,
          ),
          10.w,
          Text(
            data,
            style: GoogleFonts.quicksand(
              color: whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
