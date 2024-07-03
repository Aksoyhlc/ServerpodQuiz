import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.orange,
              width: 5,
            ),
          ),
          width: 150,
          height: 150,
          child: Center(
            child: Text(
              "Serverpod\nQuiz",
              style: GoogleFonts.playfairDisplay(
                color: primaryColor,
                fontSize: 23,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
