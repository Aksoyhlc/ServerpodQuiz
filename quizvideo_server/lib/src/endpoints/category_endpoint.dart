import 'package:quizvideo_server/src/generated/protocol.dart';
import 'package:quizvideo_server/src/helpers/database_helper.dart';
import 'package:quizvideo_server/src/implements/database.dart';
import 'package:serverpod/server.dart';

class CategoryEndpoint extends Endpoint with DatabaseHelper implements IDatabaseEndpoint<Category> {
  @override
  Future<List<Category>?> getAll(Session session, {int? limit, int? offset}) async {
    var data = await handleAction(
      session,
      () => Category.db.find(
        session,
        orderBy: (e) => e.id,
        orderDescending: true,
        limit: limit,
        offset: offset,
        include: Category.include(
          questions: CategoryQuestion.includeList(),
        ),
      ),
    );

    if (data == null) {
      return null;
    }

    return data;
  }

  @override
  Future<Category?> getById(Session session, int? id) async {
    if (id == null) {
      throw DbException(message: "Id cannot be null");
    }

    return await handleAction(
      session,
      () => Category.db.findById(session, id),
    );
  }

  @override
  Future<Category?> add(Session session, Category row) async {
    return await handleAction(
      session,
      () async {
        var cat = await Category.db.insertRow(session, row);
        await categoryQuestionAdd(row, session, cat);
        return cat;
      },
    );
  }

  @override
  Future<Category?> update(Session session, Category row) async {
    return await handleAction(
      session,
      () async {
        var result = await Category.db.updateRow(session, row);
        await categoryQuestionAdd(row, session, result);
        return result;
      },
    );
  }

  Future<void> categoryQuestionAdd(Category row, Session session, Category result) async {
    var ids = await CategoryQuestion.db.find(
      session,
      where: (e) => e.categoryId.equals(row.id),
    );

    for (var el in row.questionIds ?? []) {
      if (ids.any((e) => e.questionId == el)) continue;

      for (var el in ids) {
        if (!row.questionIds!.any((e) => e == el.questionId)) {
          await CategoryQuestion.db.deleteRow(session, el);
        }
      }

      try {
        await CategoryQuestion.db.insertRow(
          session,
          CategoryQuestion(
            categoryId: result.id!,
            questionId: el,
            createdAt: DateTime.now(),
          ),
        );
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Future<Category?> delete(Session session, Category row) async {
    return await handleAction(
      session,
      () => Category.db.deleteRow(session, row),
    );
  }

  Future<List<Question?>> getQuestions(Session session, int category) async {
    var result = await CategoryQuestion.db.find(
      session,
      where: (e) => e.categoryId.equals(category),
      include: CategoryQuestion.include(question: Question.include()),
    );
    return result.map((e) => e.question).toList();
  }

  Future<String?> getUploadDescription(Session session, String path) async {
    try {
      var resultPath = await session.storage.createDirectFileUploadDescription(
        storageId: 'public',
        path: path,
      );

      return resultPath;
    } catch (e) {
      return null;
    }
  }

  Future<bool> verifyUpload(Session session, String path, int catId) async {
    await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );

    var url = await session.storage.getPublicUrl(
      storageId: 'public',
      path: path,
    );

    var cat = await Category.db.findById(session, catId);
    cat!.image = url.toString();
    await Category.db.updateRow(session, cat);

    return true;
  }
}
