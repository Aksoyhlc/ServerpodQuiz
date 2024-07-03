import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with StateTools {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextInput(
            name: "loginEmail",
            hintText: "E-Mail",
            onValidator: (value) {
              if ((value ?? "").isEmpty) return "Please enter your email";
              if (!value!.isEmail) {
                return "Please enter a valid email";
              }
            },
          ),
          CustomTextInput(
            name: "loginPassword",
            hintText: "Password",
            onValidator: (value) {
              if ((value ?? "").isEmpty) return "Please enter your password";
              if (value!.length < 8) {
                return "Password must be at least 8 characters";
              }
            },
          ),
          CustomButton(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                var result = await ac.login(
                  context,
                  ic.getValue("loginEmail"),
                  ic.getValue("loginPassword"),
                );

                if (result == null) {
                  bottomMessage(context, "Your login information is incorrect");
                  return;
                }
              }
            },
            title: "Login",
          ),
          TextButton(
            onPressed: () {
              ac.authPageType.value = AuthType.register;
            },
            child: Text(
              "Don't have an account? Register here",
              style: GoogleFonts.quicksand(
                color: primaryColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              ac.authPageType.value = AuthType.resetPassword;
            },
            child: Text(
              "Forgot Password?",
              style: GoogleFonts.quicksand(
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
