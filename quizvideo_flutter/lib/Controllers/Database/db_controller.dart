import 'package:get/get.dart';
import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Mixin/db_helper.dart';

import '../State/global_controller.dart';

abstract class DbController<T> with DbHelper {
  final gc = Get.find<GlobalController>();
  Future<(T?, DbException?)> add(T data);
  Future<(T?, DbException?)> update(T data);
  Future<(T?, DbException?)> delete(T data);
  Future<(T?, DbException?)> getById(T data);
  Future<(List<T>?, DbException?)> getAll({int? limit, int? offset});
}
