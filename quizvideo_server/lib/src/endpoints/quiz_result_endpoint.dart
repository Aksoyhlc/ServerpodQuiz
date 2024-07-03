import 'package:quizvideo_server/src/generated/protocol.dart';
import 'package:quizvideo_server/src/helpers/auth_helper.dart';
import 'package:quizvideo_server/src/helpers/database_helper.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class QuizResultEndpoint extends Endpoint with DatabaseHelper, AuthHelper {
  Future<QuizResult?> add(Session session, QuizResult data) async {
    int? id = await getUserId(session);
    data.userId = id;
    data.createdAt = DateTime.now();

    return await handleAction(
      session,
      () async {
        return await QuizResult.db.insertRow(session, data);
      },
    );
  }

  @override
  // TODO: implement requireLogin
  bool get requireLogin => true;

  Future<List<QuizResult>?> getAll(Session session, {int? limit, int? offset}) async {
    bool admin = await isAdmin(session);
    int? userId = await getUserId(session);
    WhereExpressionBuilder<QuizResultTable>? where;

    if (!admin) {
      where = (e) => e.userId.equals(userId);
    }
    return await handleAction(
      session,
      () async {
        var list = await QuizResult.db.find(
          session,
          where: where,
          orderBy: (e) => e.id,
          orderDescending: true,
          limit: limit,
          offset: offset,
        );

        for (var item in list) {
          if (item.typeId == 0) continue;
          if (item.type == QuizResultType.category) {
            var tmp = await Category.db.findById(session, item.typeId);
            item.typeText = tmp?.name ?? "";
          } else if (item.type == QuizResultType.quiz) {
            var tmp = await Quiz.db.findById(session, item.typeId);
            item.typeText = tmp?.title ?? "";
          }
        }

        return list;
      },
    );
  }

  Future<List<User>?> leaderBoard(Session session) async {
    return await handleAction(
      session,
      () async {
        List<User> users = [];
        var result = await session.db.unsafeQuery("""
            SELECT SUM(qr.point) as point, "qr"."userId", u."name" ,sui."userName" ,sui."fullName" ,sui.email, sui."imageUrl", sui."userIdentifier" ,sui.created ,sui."blocked" 
FROM quiz_result qr
INNER JOIN serverpod_user_info sui ON sui.id = "qr"."userId"
INNER JOIN "user" u ON u."userInfoId" = sui.id 
GROUP BY "qr"."userId", u."name" ,sui."userName" ,sui."fullName" ,sui.email, sui."imageUrl", sui."userIdentifier" ,sui.created ,sui."blocked" 

             """);

        for (var el in result) {
          var asd = el.toColumnMap();
          asd["scopeNames"] = [];

          User user = User.fromJson({
            "name": asd["name"],
            "userInfoId": asd["userId"],
            "userInfo": asd,
            "point": asd["point"],
          });
          users.add(user);
        }
        return users;
      },
    );
  }

  Future<AdminQuizResult?> adminResult(Session session, int? userId) async {
    return await handleAction(
      session,
      () async {
        var as = await QuizResult.db.find(session);
        var users = await UserInfo.db.find(session);
        var result = AdminQuizResult(
          resultCount: {},
          userCount: {},
          correctCount: {},
          wrongCount: {},
        );

        int year = DateTime.now().year;

        for (int i = 1; i < 13; i++) {
          result.resultCount[i] = as
              .where((e) =>
                  e.createdAt?.month == i && e.createdAt?.year == year && (userId == null ? true : e.userId == userId))
              .length;
          result.userCount[i] = users
              .where((e) => e.created.month == i && e.created.year == year && (userId == null ? true : e.id == userId))
              .length;
          var filter = as.where((e) =>
              e.createdAt?.month == i && e.createdAt?.year == year && (userId == null ? true : e.userId == userId));

          result.correctCount[i] = filter.fold(0, (previousValue, element) => previousValue + element.correctCount);
          result.wrongCount[i] = filter.fold(0, (previousValue, element) => previousValue + element.wrongCount);
        }
        return result;
      },
    );
  }
}
