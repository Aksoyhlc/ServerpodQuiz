import 'package:flutter/material.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Extensions/list.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';

import 'Widgets/menu_item.dart';
import 'Widgets/sub_menu_item.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            /*DrawerMenuItem(
              name: "home",
              title: "Home Page",
              icon: Icons.home_outlined,
            ),*/
            const DrawerMenuItem(
              name: "question",
              title: "Question",
              icon: Icons.question_mark_outlined,
              subMenuItems: [
                SubMenuItem(
                  name: "questionAdd",
                  title: "Question Add",
                  parentName: "question",
                ),
                SubMenuItem(
                  name: "questionList",
                  title: "Question List",
                  parentName: "question",
                ),
              ],
            ),
            const DrawerMenuItem(
              name: "category",
              title: "Category",
              icon: Icons.category_outlined,
              subMenuItems: [
                SubMenuItem(
                  name: "categoryAdd",
                  title: "Category Add",
                  parentName: "category",
                ),
                SubMenuItem(
                  name: "categoryList",
                  title: "Category List",
                  parentName: "category",
                ),
              ],
            ),
            const DrawerMenuItem(
              name: "quiz",
              title: "Quiz",
              icon: Icons.quiz_outlined,
              subMenuItems: [
                SubMenuItem(
                  name: "quizAdd",
                  title: "Quiz Add",
                  parentName: "quiz",
                ),
                SubMenuItem(
                  name: "quizList",
                  title: "Quiz List",
                  parentName: "quiz",
                ),
              ],
            ),
            const DrawerMenuItem(
              name: "users",
              title: "Users",
              icon: Icons.supervised_user_circle_outlined,
            ),
            const DrawerMenuItem(
              name: "result",
              title: "Results",
              icon: Icons.area_chart_outlined,
            ),
            /*DrawerMenuItem(
              name: "settings",
              title: "Settings",
              icon: Icons.settings_applications_outlined,
            ),*/
            const DrawerMenuItem(
              name: "logout",
              title: "Logout",
              icon: Icons.logout,
              textColor: redColor,
            ),
          ].seperatedBy(10.h),
        ),
      ),
    );
  }
}
