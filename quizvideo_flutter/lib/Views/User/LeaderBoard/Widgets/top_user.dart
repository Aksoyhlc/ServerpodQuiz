import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/generated/assets.dart';

class LeaderBoardTopUser extends StatefulWidget {
  const LeaderBoardTopUser({super.key, required this.rank, required this.user});
  final int rank;
  final User user;

  @override
  State<LeaderBoardTopUser> createState() => _LeaderBoardTopUserState();
}

class _LeaderBoardTopUserState extends State<LeaderBoardTopUser> with StateTools {
  bool get leader => widget.rank == 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bottomMessage(
          context,
          "${widget.user.name}\nPoint: ${widget.user.point}",
          type: MessageType.info,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: leader ? 0 : 100),
        child: Column(
          children: [
            if (leader)
              Image.asset(
                Assets.imagesImg,
                width: 40,
                height: 40,
              ),
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.network(widget.user.userInfo?.imageUrl ?? "").image,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: !leader ? primaryLightColor : orangeColor,
                      width: 5,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: leader ? orangeColor : primaryLightColor,
                      ),
                      child: Center(
                        child: Text(
                          widget.rank.toString(),
                          style: GoogleFonts.quicksand(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
