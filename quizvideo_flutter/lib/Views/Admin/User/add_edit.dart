import 'package:bootstrap_flutter_plus/bootstrap_flutter_plus.dart';
import 'package:flutter/material.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Controllers/Database/user_contoller.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Helpers/ext.dart';
import 'package:quizvideo_flutter/Mixin/state_tools.dart';
import 'package:quizvideo_flutter/Views/Widgets/DropDown/dropdown.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_button.dart';
import 'package:quizvideo_flutter/Views/Widgets/custom_field.dart';
import 'package:quizvideo_flutter/Views/Widgets/global_app_bar.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as sac;

class UserCrud extends StatefulWidget {
  const UserCrud({super.key, this.user});
  final User? user;

  @override
  State<UserCrud> createState() => _UserCrudState();
}

class _UserCrudState extends State<UserCrud> with StateTools {
  bool get isEdit => widget.user != null;
  //User? get user => widget.user;
  User user = User(name: "", userInfoId: 0);
  sac.UserInfo get userInfo => user.userInfo!;
  final uc = UserDbController();

  @override
  void initState() {
    // TODO: implement initState
    ic.clearAll();
    super.initState();

    if (widget.user != null) {
      user = widget.user!;
    }
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GlobalAppBar(title: "${isEdit ? "Edit" : "Add"} User"),
          Expanded(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  BsContainer(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    children: [
                      BsRow(
                        children: [
                          BsCol(
                            child: CustomTextInput(
                              name: "user_name",
                              hintText: "Name",
                              initialData: user.name,
                              required: true,
                              onChanged: (value) {
                                user.name = value ?? "";
                              },
                            ),
                          ),
                          BsCol(
                            child: CustomTextInput(
                              name: "user_username",
                              hintText: "Username",
                              initialData: userInfo.userName,
                              required: true,
                              onChanged: (value) {
                                userInfo.userName = value ?? "";
                              },
                            ),
                          ),
                          BsCol(
                            child: CustomTextInput(
                              name: "user_email",
                              hintText: "E-Mail",
                              initialData: userInfo.email,
                              required: true,
                              onChanged: (value) {
                                userInfo.email = value ?? "";
                              },
                            ),
                          ),
                          BsCol(
                            child: CustomTextInput(
                              name: "password",
                              hintText: "Password",
                              initialData: "",
                              obscureText: true,
                              onChanged: (value) {
                                user.password = value ?? "";
                              },
                            ),
                          ),
                          BsCol(
                            child: CustomDropDown(
                              items: const {
                                "serverpod.admin": "Admin",
                                "serverpod.user": "User",
                              },
                              selectedKeys: userInfo.scopeNames,
                              onChanged: (key, value) {
                                userInfo.scopeNames = [key];
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        var result = await uc.update(user);

                        if (result.$2 != null) {
                          bottomMessage(context, result.$2?.message);
                          return;
                        }

                        context.back();
                      }
                    },
                    title: "Save",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
