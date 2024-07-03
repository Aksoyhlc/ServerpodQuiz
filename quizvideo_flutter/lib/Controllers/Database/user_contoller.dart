import 'package:quizvideo_client/quizvideo_client.dart';
import 'package:quizvideo_flutter/Controllers/Database/db_controller.dart';

class UserDbController extends DbController<User> {
  @override
  Future<(User?, DbException?)> add(User data) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<(User?, DbException?)> delete(User data) async {
    return await handleAction(() => gc.client.user.delete(data));
  }

  @override
  Future<(List<User>?, DbException?)> getAll({int? limit, int? offset}) async {
    return await handleAction(
      () => gc.client.user.getAll(
        limit: limit,
        offset: offset,
      ),
    );
  }

  @override
  Future<(User?, DbException?)> getById(User data) async {
    return await handleAction(() => gc.client.user.getById(data.id!));
  }

  Future<(User?, DbException?)> getByUserInfoId(int id) async {
    return await handleAction(() => gc.client.user.getByUserInfoId(id));
  }

  @override
  Future<(User?, DbException?)> update(User data) async {
    return await handleAction(() => gc.client.user.update(data));
  }
}
