import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';

class CenterTextMessage extends StatelessWidget {
  const CenterTextMessage(this.message, {super.key, this.fontSize = 20});
  final String message;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          message,
          style: GoogleFonts.quicksand(
            color: primaryColor.withOpacity(.6),
            fontSize: fontSize,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
