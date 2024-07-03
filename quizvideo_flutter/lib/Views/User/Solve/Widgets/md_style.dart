import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';

MarkdownStyleSheet buildMarkdownStyleSheet() {
  return MarkdownStyleSheet(
    a: mdStyle(),
    p: mdStyle(),
    listBullet: mdStyle(),
    strong: mdStyle().copyWith(
      fontWeight: FontWeight.bold,
    ),
  );
}

TextStyle mdStyle() {
  return GoogleFonts.quicksand(
    color: darkGreyColor2,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}
