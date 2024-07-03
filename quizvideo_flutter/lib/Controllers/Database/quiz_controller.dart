import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Controllers/Database/db_controller.dart';

class QuizDbController extends DbController<Quiz> {
  @override
  Future<(Quiz?, DbException?)> add(Quiz data) async {
    return await handleAction(() => gc.client.quiz.add(data));
  }

  @override
  Future<(Quiz?, DbException?)> delete(Quiz data) async {
    return await handleAction(() => gc.client.quiz.delete(data));
  }

  @override
  Future<(List<Quiz>?, DbException?)> getAll({int? limit, int? offset}) {
    return handleAction(() => gc.client.quiz.getAll(limit: limit, offset: offset));
  }

  @override
  Future<(Quiz?, DbException?)> getById(Quiz data) {
    return handleAction(() => gc.client.quiz.getById(data.id!));
  }

  @override
  Future<(Quiz?, DbException?)> update(Quiz data) {
    return handleAction(() => gc.client.quiz.update(data));
  }
}
