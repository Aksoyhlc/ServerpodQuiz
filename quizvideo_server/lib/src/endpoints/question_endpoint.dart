import 'package:quizvideo_server/src/generated/protocol.dart';
import 'package:quizvideo_server/src/helpers/database_helper.dart';
import 'package:quizvideo_server/src/implements/database.dart';
import 'package:serverpod/serverpod.dart';

const _channelPixelAdded = 'pixel-added';

class QuestionEndpoint extends Endpoint with DatabaseHelper implements IDatabaseEndpoint<Question> {
  @override
  Future<List<Question>?> getAll(
    Session session, {
    int? categoryId,
    int? quizId,
    int? limit,
    int? offset,
    bool admin = false,
    bool competition = false,
    bool categoryIds = false,
  }) async {
    return await handleAction(
      session,
      () async {
        Set<int> idList = {};
        bool isUserCategoryTest = (categoryId != null && !admin);
        if (isUserCategoryTest) {
          var ids = await session.db.unsafeQuery(
            r'SELECT "questionId" FROM category_question WHERE "categoryId" = @categoryId ORDER BY RANDOM() LIMIT 30',
            parameters: QueryParameters.named(
              {"categoryId": categoryId},
            ),
          );

          for (var row in ids) {
            for (var el in row) {
              idList.add(el as int);
            }
          }
        }

        WhereExpressionBuilder<QuestionTable>? where;
        if (categoryId != null) {
          where = ((e) => e.categories.any((p0) => p0.categoryId.equals(categoryId)) & e.id.inSet(idList));
          if (admin) {
            where = ((e) => e.categories.any((p0) => p0.categoryId.equals(categoryId)));
          }

          limit = 30;
        } else if (quizId != null) {
          where = ((e) => e.quizs.any((p0) => p0.quizId.equals(quizId)));
        }

        return await Question.db.find(
          session,
          orderBy: isUserCategoryTest ? null : (e) => e.id,
          orderDescending: !isUserCategoryTest,
          where: where,
          limit: limit,
          offset: offset,
          include: Question.include(
            categories: categoryId == null && !categoryIds ? null : CategoryQuestion.includeList(),
            quizs: quizId == null ? null : QuizQuestion.includeList(),
          ),
        );
      },
    );
  }

  @override
  Future<Question?> add(Session session, Question question) async {
    question.createdAt = DateTime.now();
    return await handleAction(
      session,
      () async {
        var result = await Question.db.insertRow(session, question);

        if (result.id == null) {
          throw DbException(message: "Id cannot be null");
        }

        await _categoryQuestionAdd(question, result, session);
        return result;
      },
    );
  }

  Future<void> _categoryQuestionAdd(Question question, Question result, Session session) async {
    List<CategoryQuestion> list = [];

    for (var el in question.categoryIds ?? []) {
      list.add(CategoryQuestion(questionId: result.id!, categoryId: int.tryParse(el) ?? 0, createdAt: DateTime.now()));
    }

    await CategoryQuestion.db.insert(session, list);
  }

  @override
  Future<Question?> update(Session session, Question question) async {
    question.updatedAt = DateTime.now();
    await CategoryQuestion.db.deleteWhere(session, where: (e) => e.questionId.equals(question.id));
    await _categoryQuestionAdd(question, question, session);
    return await handleAction(
      session,
      () => Question.db.updateRow(session, question),
    );
  }

  @override
  Future<Question?> delete(Session session, Question question) async {
    return await handleAction(
      session,
      () => Question.db.deleteRow(session, question),
    );
  }

  @override
  Future<Question?> getById(Session session, int id) async {
    return await handleAction(
      session,
      () => Question.db.findById(session, id),
    );
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    // TODO: implement streamOpened
    session.messages.addListener(_channelPixelAdded, (update) {
      sendStreamMessage(session, update);
    });
  }

  @override
  Future<void> streamClosed(StreamingSession session) {
    // TODO: implement streamClosed
    return super.streamClosed(session);
  }

  @override
  Future<void> handleStreamMessage(StreamingSession session, SerializableModel message) {
    // TODO: implement handleStreamMessage
    print("TTT");
    session.messages.postMessage(_channelPixelAdded, message);
    print(message.toJson());
    return super.handleStreamMessage(session, message);
  }

  @override
  Future<void> sendStreamMessage(StreamingSession session, SerializableModel message) {
    // TODO: implement sendStreamMessage
    print("OOO");
    print(message.toJson());
    return super.sendStreamMessage(session, message);
  }
}
