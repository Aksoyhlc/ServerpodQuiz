import 'package:serverpod/serverpod.dart';

mixin AuthHelper {
  Future<int?> getUserId(Session session) async {
    return (await session.authenticated)?.userId;
  }

  Future<bool> isAdmin(Session session) async {
    var scopes = (await session.authenticated)?.scopes;
    return scopes?.contains(Scope.admin) ?? false;
  }
}
