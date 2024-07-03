import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with StateTools {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            "Register",
            style: context.textTheme.titleMedium,
          ),
          CustomTextInput(
            name: "registerName",
            hintText: "Name",
            onValidator: (value) {
              if (value!.isEmpty) return "Please enter name";
            },
          ),
          CustomTextInput(
            name: "registerUsername",
            hintText: "Username",
            onValidator: (value) {
              if (value!.isEmpty) return "Please enter username";
            },
          ),
          CustomTextInput(
            name: "registerEmail",
            hintText: "E-Mail",
            onValidator: (value) {
              if ((value ?? "").isEmpty) return "Please enter your email";
              if (!value!.isEmail) {
                return "Please enter a valid email";
              }
            },
          ),
          CustomTextInput(
            name: "registerPassword",
            hintText: "Password",
            obscureText: true,
            onValidator: (value) {
              if ((value ?? "").isEmpty) return "Please enter your password";
              if (value!.length < 8) {
                return "Password must be at least 8 characters";
              }
            },
          ),
          CustomButton(
            onTap: () async {
              if ((_formKey.currentState?.validate()) ?? false) {
                var result = await ac.authController.createAccountRequest(
                  ic.getValue("registerUsername"),
                  ic.getValue("registerEmail"),
                  ic.getValue("registerPassword"),
                );
                if (result) {
                  ac.authPageType.value = AuthType.emailValidation;
                } else {
                  bottomMessage(context, "Something went wrong");
                }
              }
            },
            title: "Register",
          ),
          TextButton(
            onPressed: () {
              ac.authPageType.value = AuthType.login;
            },
            child: Text(
              "If you already have an account, login here",
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
