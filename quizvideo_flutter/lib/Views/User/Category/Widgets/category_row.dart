import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Views/User/Widgets/competition_confirm.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key, required this.item});
  final Category item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        competitionConfirm(context, category: item);
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
            Image.network(
              item.image ?? "",
              height: 40,
              width: 40,
            ),
            10.w,
            Expanded(
              child: Text(
                item.name,
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
