import 'package:quizvideo_server/src/generated/protocol.dart';
import 'package:quizvideo_server/src/helpers/auth_helper.dart';
import 'package:quizvideo_server/src/helpers/database_helper.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import '../implements/database.dart';

class UserEndpoint extends Endpoint with DatabaseHelper, AuthHelper implements IDatabaseEndpoint<User> {
  /*@override
  // TODO: implement requireLogin
  bool get requireLogin => true;

  @override
  // TODO: implement requiredScopes
  Set<Scope> get requiredScopes => {Scope.admin};*/

  Future<bool> userInfoUpdate(Session session, User user) async {
    try {
      bool res = await session.isUserSignedIn;
      if (!res) {
        return false;
      }

      var id = (await session.authenticated)?.userId;
      if (id == null) {
        return false;
      }
      var userInfo = await Users.findUserByUserId(session, id);
      if (userInfo == null) {
        return false;
      }
      var userInfoData = await User.db.findFirstRow(session, where: (e) => e.userInfoId.equals(id));
      if (userInfoData == null) {
        await User.db.insertRow(session, user);
      } else {
        User result = await User.db.updateRow(session, user.copyWith(userInfo: userInfo));
      }

      return true;
    } catch (e, s) {
      print(e);
      print(s);
      return false;
    }
  }

  @override
  Future<User?> add(Session session, User data) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<User?> delete(Session session, User data) async {
    return await handleAction(
      session,
      () async {
        await UserInfo.db.deleteWhere(
          session,
          where: (p0) => p0.id.equals(data.userInfoId),
        );

        return null;
      },
    );
  }

  @override
  Future<List<User>?> getAll(Session session, {int? limit, int? offset}) async {
    return await handleAction(
      session,
      () async {
        var list = await User.db.find(
          session,
          include: User.include(
            userInfo: UserInfo.include(),
          ),
          limit: limit,
          offset: offset,
        );
        return list;
      },
    );
  }

  @override
  Future<User?> getById(Session session, int id) {
    return handleAction(
      session,
      () => User.db.findById(
        session,
        id,
        include: User.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );
  }

  Future<User?> getByUserInfoId(Session session, int id) {
    return handleAction(
      session,
      () {
        return User.db.findFirstRow(
          session,
          where: (e) => e.userInfoId.equals(id),
          include: User.include(
            userInfo: UserInfo.include(),
          ),
        );
      },
    );
  }

  @override
  Future<User?> update(Session session, User data) async {
    return await handleAction(
      session,
      () async {
        await UserInfo.db.updateRow(session, data.userInfo!);
        return await User.db.updateRow(session, data);
      },
    );
  }
}
