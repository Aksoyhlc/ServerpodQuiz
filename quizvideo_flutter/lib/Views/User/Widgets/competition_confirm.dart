import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Views/User/Solve/solve.dart';
import 'package:quizvideo_flutter/Views/User/UserFind/radar.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';

Future<dynamic> competitionConfirm(BuildContext context, {Quiz? quiz, Category? category}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.3),
              blurRadius: 20,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 50,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You can solve the quiz together by pairing up with an online user and starting a competition.\nDo you want to solve it alone or paired with a user?",
              style: GoogleFonts.quicksand(
                color: darkGreyColor2,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            20.h,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      context.to(
                        OnlineUserFind(
                          competitionStatus: false,
                          quiz: quiz,
                          category: category,
                        ),
                      );
                    },
                    title: "Solve with a user",
                    bgColor: blueColor,
                  ),
                ),
                15.w,
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      context.to(
                        SolvePage(
                          category: category,
                          quiz: quiz,
                        ),
                      );
                    },
                    title: "Solve alone",
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
