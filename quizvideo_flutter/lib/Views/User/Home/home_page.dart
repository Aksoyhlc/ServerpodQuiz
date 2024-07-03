import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/Database/category_controller.dart';
import 'package:quizvideo_flutter/Controllers/Database/quiz_controller.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Auth/login_register.dart';
import 'package:quizvideo_flutter/Views/User/History/history.dart';
import 'package:quizvideo_flutter/Views/User/LeaderBoard/leader_board.dart';
import 'package:quizvideo_flutter/Views/User/Profil/profile.dart';
import 'package:quizvideo_flutter/Views/Widgets/center_text_message.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';
import 'package:quizvideo_flutter/Views/Widgets/loading.dart';

import 'category_builder.dart';
import 'quiz_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with StateTools, SingleTickerProviderStateMixin {
  final cc = CategoryDbController();
  final qc = QuizDbController();

  (List<Category>?, DbException?) categories = (null, null);
  (List<Quiz>?, DbException?) quizs = (null, null);

  fetchData() async {
    try {
      categories = await run(() {
        return cc.getAll(limit: 10);
      });
      quizs = await run2(() => qc.getAll(limit: 10));
    } catch (e) {
      print(e);
    }
  }

  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ConvexAppBar(
          items: const [
            TabItem(icon: Icons.bar_chart, title: 'Leaderboard'),
            TabItem(icon: Icons.home_outlined, title: 'Home'),
            TabItem(icon: Icons.history, title: 'History'),
            TabItem(icon: Icons.person_outline, title: 'Profil'),
          ],
          backgroundColor: primaryColor,
          initialActiveIndex: 1,
          controller: controller,
          onTap: (int value) {
            if (value == 0) {
              context.to(const LeaderBoard());
            } else if (value == 1) {
              context.to(const HomePage());
            } else if (value == 2) {
              context.to(const HistoricalResults());
            } else if (value == 3) {
              context.to(const ProfilePage());
            }
            controller.animateTo(1);
          },
        ),
        body: Column(
          children: [
            GlobalAppBar(
              title: "Serverpod Quiz App",
              back: false,
              actions: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      bottomMessage(context, "Powered By AKSOYHLC", type: MessageType.info);
                    },
                    icon: const Icon(
                      Icons.question_mark_outlined,
                      color: whiteColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await ac.logout();
                      context.toRemove(const AuthPage());
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loading();
                  }

                  if (snapshot.hasError) {
                    return CenterTextMessage(snapshot.error.toString());
                  }

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        if (categories.$2 == null) CategoryBuilder(categories: categories.$1),
                        if (quizs.$2 == null) QuizBuilder(quizs: quizs.$1),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
