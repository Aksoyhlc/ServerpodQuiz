import 'package:quizvideo_server/src/generated/protocol.dart';
import 'package:quizvideo_server/src/helpers/database_helper.dart';
import 'package:quizvideo_server/src/implements/database.dart';
import 'package:serverpod/serverpod.dart';

class QuizEndpoint extends Endpoint with DatabaseHelper implements IDatabaseEndpoint<Quiz> {
  @override
  Future<Quiz?> add(Session session, Quiz data) {
    return handleAction(
      session,
      () async {
        data.createdAt = DateTime.now();

        var result = await Quiz.db.insertRow(session, data);
        if (result.id == null) {
          throw DbException(message: "Id cannot be null");
        }

        List<QuizQuestion> list = [];

        data.questionsIds?.forEach(
          (element) {
            list.add(
              QuizQuestion(
                quizId: result.id!,
                questionId: int.parse(element),
                createdAt: DateTime.now(),
              ),
            );
          },
        );

        await QuizQuestion.db.insert(session, list);

        return result;
      },
    );
  }

  @override
  Future<Quiz?> delete(Session session, Quiz data) {
    return handleAction(session, () => Quiz.db.deleteRow(session, data));
  }

  @override
  Future<List<Quiz>?> getAll(Session session, {int? limit, int? offset}) async {
    return await handleAction(
      session,
      () {
        return Quiz.db.find(
          session,
          orderBy: (e) => e.id,
          orderDescending: true,
          where: (p0) => p0.status.equals(QuizStatus.active),
          limit: limit,
          offset: offset,
          include: Quiz.include(
            questions: QuizQuestion.includeList(),
          ),
        );

        /*final st = GetStorage();
        String? cacheData = st.read(cacheKey);
        if (cacheData != null) {
          var map = jsonDecode(cacheData);

          for (var e in map) {
            result.add(Quiz.fromJson(e));
          }
        }

        if (cacheData == null) {
          result = await Quiz.db.find(
            session,
            orderBy: (e) => e.id,
            orderDescending: true,
            where: (p0) => p0.status.equals(QuizStatus.active),
            limit: limit,
            offset: offset,
            include: Quiz.include(
              questions: QuizQuestion.includeList(),
            ),
          );

          st.write(cacheKey, jsonEncode(result));
        }

        List<Quiz> list = [];

        for (var e in result) {
          if (e == null) continue;
          list.add(e);
        }

        return list;*/
      },
    );
  }

  @override
  Future<Quiz?> getById(Session session, int id) {
    return handleAction(
      session,
      () {
        return Quiz.db.findById(
          session,
          id,
          include: Quiz.include(
            questions: QuizQuestion.includeList(),
          ),
        );
      },
    );
  }

  @override
  Future<Quiz?> update(Session session, Quiz data) {
    return handleAction(
      session,
      () async {
        data.updatedAt = DateTime.now();

        var result = await Quiz.db.updateRow(session, data);
        await QuizQuestion.db.deleteWhere(session, where: (e) => e.quizId.equals(result.id!));

        List<QuizQuestion> list = [];

        data.questionsIds?.forEach(
          (element) {
            list.add(
              QuizQuestion(
                quizId: result.id!,
                questionId: int.parse(element),
                createdAt: DateTime.now(),
              ),
            );
          },
        );

        await QuizQuestion.db.insert(session, list);

        return result;
      },
    );
  }
}
