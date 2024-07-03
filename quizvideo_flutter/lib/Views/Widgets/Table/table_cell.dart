import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';

class CustomTableCell extends StatelessWidget {
  const CustomTableCell(
    this.text, {
    super.key,
    this.header = false,
    this.widget,
  });
  final String? text;
  final bool header;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: .1,
          color: Colors.grey,
        ),
        color: header ? lightColor : whiteColor,
      ),
      height: 60,
      padding: const EdgeInsets.all(10),
      child: Center(
        child: widget ??
            Text(
              (text ?? "") == "null" ? "" : (text ?? ""),
              style: GoogleFonts.quicksand(
                color: darkColor,
                fontWeight: header ? FontWeight.bold : FontWeight.normal,
                fontSize: 15,
              ),
            ),
      ),
    );
  }
}
