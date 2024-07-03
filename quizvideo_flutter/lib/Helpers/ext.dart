import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/State/auth_contoller.dart';
import 'package:quizvideo_flutter/Controllers/State/drawer_controller.dart';
import 'package:quizvideo_flutter/Controllers/State/global_controller.dart';
import 'package:quizvideo_flutter/Controllers/State/input_contoller.dart';
import 'package:quizvideo_flutter/Controllers/State/solve_controller.dart';

controllerInjection() {
  if (!Get.isRegistered<GlobalController>()) {
    Get.put(GlobalController());
  }

  if (!Get.isRegistered<AuthContoller>()) {
    Get.put(AuthContoller());
  }

  if (!Get.isRegistered<InputController>()) {
    Get.put(InputController());
  }

  if (!Get.isRegistered<CustomDrawerController>()) {
    Get.put(CustomDrawerController());
  }

  if (!Get.isRegistered<SolveController>()) {
    Get.put(SolveController());
  }
}

bottomMessage(BuildContext context, String? content, {String? title, MessageType type = MessageType.error}) {
  Color color = Colors.red;

  if (type == MessageType.success) {
    color = Colors.green;
  } else if (type == MessageType.warning) {
    color = Colors.yellow;
  } else if (type == MessageType.info) {
    color = Colors.blue;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Column(
        children: [
          if (title != null)
            Text(
              title,
              style: GoogleFonts.playfairDisplay(
                color: whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (content != null)
            Text(
              content,
              style: GoogleFonts.playfairDisplay(
                color: whiteColor,
                fontSize: 18,
              ),
            ),
        ],
      ),
    ),
  );
}

String printDuration(Duration duration) {
  String negativeSign = duration.isNegative ? '-' : '';
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60).abs());
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60).abs());
  return "$negativeSign$twoDigitMinutes:$twoDigitSeconds";
}
