import 'package:async/async.dart';
import 'package:get/get.dart';
import 'package:quizvideo_flutter/Controllers/State/auth_contoller.dart';
import 'package:quizvideo_flutter/Controllers/State/drawer_controller.dart';
import 'package:quizvideo_flutter/Controllers/State/global_controller.dart';
import 'package:quizvideo_flutter/Controllers/State/input_contoller.dart';
import 'package:quizvideo_flutter/Controllers/State/solve_controller.dart';
import 'package:quizvideo_flutter/Helpers/storage_helper.dart';

mixin StateTools {
  final gc = Get.find<GlobalController>();
  final ic = Get.find<InputController>();
  final ac = Get.find<AuthContoller>();
  final sc = Get.find<SolveController>();
  final dc = Get.find<CustomDrawerController>();

  final st = StorageHelper();

  final memoizer = AsyncMemoizer();
  final memoizer2 = AsyncMemoizer();

  Future<T> run<T>(Future<T?> Function() callback) async {
    return await memoizer.runOnce(() async {
      return await callback();
    });
  }

  Future<T> run2<T>(Future<T?> Function() callback) async {
    return await memoizer2.runOnce(() async {
      return await callback();
    });
  }
}
