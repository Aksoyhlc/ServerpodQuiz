import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';
import 'package:quizvideo_flutter/Views/Widgets/loading.dart';

import 'Widgets/top_user.dart';
import 'Widgets/user_row.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> with StateTools {
  List<User> users = [];
  fetchData() async {
    users = (await gc.client.quizResult.leaderBoard()) ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColor,
        body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loading();
            }

            return Column(
              children: [
                const GlobalAppBar(
                  title: "Leader Board",
                  borderRadius: false,
                ),
                ClipPath(
                  clipper: LeaderClipper(),
                  child: Container(
                    height: context.height * .30,
                    width: context.width,
                    color: primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (users.length > 1) LeaderBoardTopUser(rank: 2, user: users[1]),
                        if (users.isNotEmpty) LeaderBoardTopUser(rank: 1, user: users[0]),
                        if (users.length > 2) LeaderBoardTopUser(rank: 3, user: users[2]),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length - 3,
                    itemBuilder: (context, index) {
                      index = index + 3;
                      return LeaderBoardUser(
                        user: users[index],
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class LeaderClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    final double width = size.width;
    final double height = size.height;
    path.moveTo(0, 0);
    path.lineTo(0, height);
    path.quadraticBezierTo(
      width / 2,
      height / 1.5,
      width,
      height,
    );
    path.lineTo(width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
