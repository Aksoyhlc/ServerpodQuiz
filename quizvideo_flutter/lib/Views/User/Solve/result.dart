import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/State/solve_controller.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Extensions/list.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Views/User/Home/home_page.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';

class SolveResult extends StatelessWidget {
  const SolveResult({super.key});

  @override
  Widget build(BuildContext context) {
    final sc = Get.find<SolveController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColor,
        body: Column(
          children: [
            const GlobalAppBar(title: "Solve Result", back: false),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResultRow(
                    title: "Correct",
                    color: greenColor2,
                    icon: Icons.check_circle_outline,
                    result: sc.correctCount.toString(),
                  ),
                  ResultRow(
                    title: "Wrong",
                    color: redColor,
                    icon: Icons.close,
                    result: sc.wrongCount.toString(),
                  ),
                  ResultRow(
                    title: "Score",
                    color: blueColor,
                    icon: Icons.score_outlined,
                    result: sc.point.toString(),
                  ),
                  CustomButton(
                    onTap: () {
                      context.toRemove(const HomePage());
                    },
                    title: "Home",
                  )
                ].seperatedBy(15.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultRow extends StatelessWidget {
  const ResultRow({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.result,
  });
  final String title;
  final IconData icon;
  final Color color;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: color,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 40,
          ),
          10.w,
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                result,
                style: GoogleFonts.quicksand(
                  color: whiteColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
