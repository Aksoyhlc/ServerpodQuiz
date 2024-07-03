import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Extensions/num.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';

import 'Forms/email_validation.dart';
import 'Forms/login.dart';
import 'Forms/register.dart';
import 'Forms/reset_password.dart';
import 'Widgets/logo.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key, this.isLogin = true});

  final bool isLogin;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with StateTools {
  @override
  void initState() {
    super.initState();
    ac.authPageType.value = widget.isLogin ? AuthType.login : AuthType.register;
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          bottomNavigationBar: SizedBox(
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Powered by ",
                  style: GoogleFonts.quicksand(
                    color: whiteColor,
                    fontSize: 16,
                  ),
                ),
                2.w,
                Text(
                  "Aksoyhlc",
                  style: GoogleFonts.bebasNeue(
                    color: whiteColor,
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AuthLogo(),
              const SizedBox(height: 20),
              Container(
                constraints: BoxConstraints(
                  maxWidth: context.isPhone ? context.width : 600,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: whiteColor,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Obx(() {
                  if (ac.authPageType.value == AuthType.login) return const LoginForm();
                  if (ac.authPageType.value == AuthType.resetPassword) return const ResetPasswordForm();
                  if (ac.authPageType.value == AuthType.register) return const RegisterForm();
                  if (ac.authPageType.value == AuthType.emailValidation) return const EmailValidationForm();
                  return Container();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
