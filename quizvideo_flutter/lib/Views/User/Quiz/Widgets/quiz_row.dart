import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Views/User/Widgets/competition_confirm.dart';

class QuizRow extends StatelessWidget {
  const QuizRow({
    super.key,
    required this.item,
  });

  final Quiz item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await competitionConfirm(context, quiz: item);
        /*confirmDialog(
          context: context,
          message: "You are about to start a new quiz, are you sure you want to start?",
          onConfirm: () {
            context.back();
            context.to(SolvePage(quiz: item));
          },
        );*/
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              offset: const Offset(0, 4),
              blurRadius: 9,
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.title ?? "",
                style: GoogleFonts.quicksand(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: primaryColor,
              size: 35,
            )
          ],
        ),
      ),
    );
  }
}
