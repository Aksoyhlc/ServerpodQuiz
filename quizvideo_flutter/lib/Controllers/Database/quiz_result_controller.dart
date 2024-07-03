import 'package:get/get.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Controllers/State/global_controller.dart';
import 'package:quizvideo_flutter/Mixin/db_helper.dart';

class QuizResultController with DbHelper {
  final gc = Get.find<GlobalController>();
  Future<(QuizResult?, DbException?)> add(QuizResult data) async {
    return await handleAction(() => gc.client.quizResult.add(data));
  }

  Future<(List<QuizResult>?, DbException?)> getAll({int? limit, int? offset}) async {
    return await handleAction(() => gc.client.quizResult.getAll(limit: limit, offset: offset));
  }

  Future<(AdminQuizResult?, DbException?)> getAdminResults({int? userId}) async {
    return await handleAction(() => gc.client.quizResult.adminResult(userId));
  }
}
