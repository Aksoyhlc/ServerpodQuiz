import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Const/const.dart';
import 'package:quizvideo_flutter/Controllers/Database/user_contoller.dart';
import 'package:quizvideo_flutter/Controllers/State/global_controller.dart';
import 'package:quizvideo_flutter/Extensions/context.dart';
import 'package:quizvideo_flutter/Helpers/storage_helper.dart';
import 'package:quizvideo_flutter/Views/Admin/Home/home.dart';
import 'package:quizvideo_flutter/Views/User/Home/home_page.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart' show UserInfo;
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class AuthContoller extends GetxController {
  final gc = Get.find<GlobalController>();
  late SessionManager sessionManager;
  late EmailAuthController authController;
  final st = StorageHelper();

  Rx<AuthType> authPageType = AuthType.login.obs;

  bool get isLogin => sessionManager.isSignedIn;
  bool get isAdmin => sessionManager.signedInUser?.scopeNames.contains("serverpod.admin") ?? false;

  UserInfo? get userInfo => sessionManager.signedInUser;
  Rx<User> user = User(name: '', userInfoId: 0).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sessionManager = SessionManager(
      caller: gc.client.modules.auth,
    );
    authController = EmailAuthController(gc.client.modules.auth);

    sessionManager.addListener(
      () {
        update(["auth_control"]);
      },
    );
  }

  Future<void> logout() async {
    await sessionManager.signOut();
    await st.remove("email");
    await st.remove("password");
  }

  Future<UserInfo?> login(BuildContext context, String email, String password, {bool redirect = true}) async {
    var result = await authController.signIn(email, password);

    if (result == null) {
      return null;
    }

    await st.write("email", email);
    await st.write("password", password);

    var data = await UserDbController().getByUserInfoId(result.id ?? 0);

    if (data.$1 == null) {
      return null;
    }

    user.value = data.$1!;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (redirect) {
        context.toRemove(isAdmin ? const AdminHomePage() : const HomePage());
      }
    });

    return result;
  }
}
