import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Controllers/Database/db_controller.dart';

class QuestionDbController extends DbController<Question> {
  QuestionDbController() : super();

  @override
  Future<(Question?, DbException?)> add(Question data) async {
    return await handleAction(() => gc.client.question.add(data));
  }

  @override
  Future<(Question?, DbException?)> delete(Question data) {
    return handleAction(() => gc.client.question.delete(data));
  }

  @override
  Future<(List<Question>?, DbException?)> getAll({
    int? categoryId,
    int? quizId,
    int? limit,
    int? offset,
    bool admin = false,
    bool competition = false,
    bool categoryIds = false,
  }) {
    return handleAction(
      () => gc.client.question.getAll(
        limit: limit,
        offset: offset,
        categoryId: categoryId,
        quizId: quizId,
        admin: admin,
        competition: competition,
        categoryIds: categoryIds,
      ),
    );
  }

  @override
  Future<(Question?, DbException?)> getById(Question data) {
    return handleAction(() => gc.client.question.getById(data.id!));
  }

  @override
  Future<(Question?, DbException?)> update(Question data) {
    return handleAction(() => gc.client.question.update(data));
  }
}
