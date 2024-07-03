import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Admin/Result/result.dart';
import 'package:quizvideo_flutter/Views/Auth/login_register.dart';
import 'package:quizvideo_flutter/Views/Widgets/center_text_message.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';

import '../Layout/Drawer/drawer.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> with StateTools {
  @override
  Widget build(BuildContext context) {
    if (!ac.isAdmin) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CenterTextMessage("You are not an admin"),
          CustomButton(
            onTap: () async {
              await ac.logout();
              context.toRemove(const AuthPage());
            },
            title: "Home Page",
          ),
        ],
      );
    }
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 50,
          color: whiteColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Powered by ",
                style: GoogleFonts.quicksand(
                  color: primaryColor,
                  fontSize: 16,
                ),
              ),
              2.w,
              Text(
                "Aksoyhlc",
                style: GoogleFonts.bebasNeue(
                  color: primaryColor,
                  fontSize: 20,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: lightColor,
        drawer: const CustomDrawer(),
        body: ac.isAdmin
            ? const Column(
                children: [
                  GlobalAppBar(title: "Admin Home Page"),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: AdminQuizResultPage(home: true),
                  )),
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
