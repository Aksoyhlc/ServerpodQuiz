import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_field.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

enum LoginType { email, confirm }

class _ResetPasswordFormState extends State<ResetPasswordForm> with StateTools {
  LoginType type = LoginType.email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Reset Password",
          style: GoogleFonts.playfairDisplay(
            color: primaryColor,
            fontSize: 25,
          ),
        ),
        Builder(
          builder: (context) {
            if (type == LoginType.email) {
              return Column(
                children: [
                  CustomTextInput(
                    name: "resetEmail",
                    hintText: "E-Mail",
                    onValidator: (value) {
                      if ((value ?? "").isEmpty) return "Please enter your email";
                      if (!value!.isEmail) {
                        return "Please enter a valid email";
                      }
                    },
                  ),
                  CustomButton(
                    onTap: () async {
                      var result = await ac.authController.initiatePasswordReset(
                        ic.getValue("resetEmail"),
                      );
                      if (result) {
                        type = LoginType.confirm;
                        setState(() {});
                      } else {
                        bottomMessage(context, "Something went wrong");
                      }
                    },
                    title: "Next",
                  ),
                ],
              );
            } else if (type == LoginType.confirm) {
              return Column(
                children: [
                  CustomTextInput(
                    name: "resetPassword",
                    hintText: "Password",
                    onValidator: (value) {
                      if ((value ?? "").isEmpty) return "Please enter your password";
                      if (value!.length < 8) {
                        return "Password must be at least 8 characters";
                      }
                    },
                  ),
                  CustomTextInput(
                    name: "resetConfirmPassword",
                    hintText: "Confirm Password",
                    onValidator: (value) {
                      if ((value ?? "").isEmpty) return "Please enter your password";
                      if (value!.length < 8) {
                        return "Password must be at least 8 characters";
                      }
                    },
                  ),
                  CustomTextInput(
                    name: "resetPasswordValidate",
                    hintText: "Validation Code",
                    onValidator: (value) {
                      if (value!.isEmpty) return "Please enter validation code";
                    },
                  ),
                  CustomButton(
                    onTap: () async {
                      var result = await ac.authController.resetPassword(
                        ic.getValue("resetEmail"),
                        ic.getValue("resetPasswordValidate"),
                        ic.getValue("resetConfirmPassword"),
                      );

                      if (result) {
                        ac.authPageType.value = AuthType.login;
                      } else {
                        bottomMessage(context, "Something went wrong");
                      }
                    },
                    title: "Save",
                  ),
                ],
              );
            }

            return Container();
          },
        ),
        InkWell(
          onTap: () {
            ac.authPageType.value = AuthType.login;
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Login",
              style: GoogleFonts.quicksand(
                color: primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
