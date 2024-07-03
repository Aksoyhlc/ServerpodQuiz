import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Controllers/State/auth_contoller.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Helpers/storage_helper.dart';
import 'package:quizvideo_flutter/Views/Admin/Home/home.dart';

import 'Const/const.dart';
import 'Views/Auth/login_register.dart';
import 'Views/User/Home/home_page.dart';
import 'Views/Widgets/center_text_message.dart';
import 'Views/Widgets/loading.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(
        () {
          controllerInjection();
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.playfairDisplay(
            color: primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
        ),
        scaffoldBackgroundColor: whiteColor,
      ),
      home: Builder(builder: (context) {
        controllerInjection();

        return Scaffold(
          backgroundColor: lightColor,
          body: GetBuilder<AuthContoller>(
              id: "auth_control",
              builder: (logic) {
                return FutureBuilder(
                  future: fetchData(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
                      return const Loading();
                    }

                    if (snapshot.hasError) {
                      return CenterTextMessage(snapshot.error.toString());
                    }

                    if (snapshot.data ?? false) {
                      return const AdminHomePage();
                      return const HomePage();
                    }

                    return const AuthPage();
                  },
                );
              }),
        );
      }),
    );
  }

  Future<bool> fetchData(BuildContext context) async {
    final ac = Get.find<AuthContoller>();

    if (ac.isLogin) {
      return true;
    }

    final st = StorageHelper();

    var email = await st.read("email");
    var password = await st.read("password");

    if (email != null && password != null) {
      var result = await ac.login(context, email, password);
      return result != null;
    }

    return false;
  }
}
