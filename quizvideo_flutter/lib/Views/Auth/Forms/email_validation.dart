import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/User/Home/home_page.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_field.dart';

class EmailValidationForm extends StatefulWidget {
  const EmailValidationForm({super.key});

  @override
  State<EmailValidationForm> createState() => _EmailValidationFormState();
}

class _EmailValidationFormState extends State<EmailValidationForm> with StateTools {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Validation Code",
          style: context.textTheme.titleMedium,
        ),
        CustomTextInput(
          name: "registerValidate",
          hintText: "Validation Code",
          onValidator: (value) {
            if (value!.isEmpty) return "Please enter validation code";
          },
        ),
        CustomButton(
          onTap: () async {
            var result = await ac.authController.validateAccount(
              ic.getValue("registerEmail"),
              ic.getValue("registerValidate"),
            );
            var login = await ac.login(
              context,
              ic.getValue("registerEmail"),
              ic.getValue("registerPassword"),
              redirect: false,
            );

            if (login != null) {
              bool userInfoUpdate = await gc.client.user.userInfoUpdate(
                User(
                  name: ic.getValue("registerName"),
                  userInfoId: login.id!,
                ),
              );

              bottomMessage(context, "Account validated successfully", type: MessageType.success);
              context.toRemove(const HomePage());
            } else {
              bottomMessage(context, "Something went wrong");
            }
          },
          title: "Send",
        ),
        TextButton(
          onPressed: () {
            ac.authPageType.value = AuthType.register;
          },
          child: Text(
            "Back to Register",
            style: GoogleFonts.quicksand(
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
