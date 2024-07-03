import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';

class LeaderBoardUser extends StatelessWidget {
  const LeaderBoardUser({
    super.key,
    required this.user,
    required this.index,
  });
  final User user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          Text(
            (index + 1).toString(),
            style: GoogleFonts.baloo2(
              color: darkColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.w,
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              user.userInfo?.imageUrl ?? "",
              height: 40,
              width: 40,
            ),
          ),
          10.w,
          Expanded(
            child: Text(
              user.name,
              style: GoogleFonts.baloo2(
                color: darkColor,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            user.point.toString(),
            style: GoogleFonts.baloo2(
              color: darkColor,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
