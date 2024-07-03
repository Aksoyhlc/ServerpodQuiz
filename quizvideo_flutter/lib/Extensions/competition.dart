import 'package:get/get.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Controllers/State/auth_contoller.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as auth;

extension CompetitionExtension on Competition? {
  auth.UserInfo? get other {
    final ac = Get.find<AuthContoller>();
    late auth.UserInfo? user;

    if (ac.userInfo?.id == this?.user1Id) {
      user = this?.user2;
    } else {
      user = this?.user1;
    }

    return user;
  }
}
