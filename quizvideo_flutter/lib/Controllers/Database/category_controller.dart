import 'package:quizvideo_client/quizvideo_client.dart';

import 'db_controller.dart';

class CategoryDbController extends DbController<Category> {
  @override
  Future<(Category?, DbException?)> add(Category data) async {
    return await handleAction(() => gc.client.category.add(data));
  }

  @override
  Future<(Category?, DbException?)> delete(Category data) async {
    return await handleAction(() => gc.client.category.delete(data));
  }

  @override
  Future<(Category?, DbException?)> getById(Category data) async {
    return await handleAction(() => gc.client.category.getById(data.id));
  }

  @override
  Future<(Category?, DbException?)> update(Category data) async {
    return await handleAction(() => gc.client.category.update(data));
  }

  @override
  Future<(List<Category>?, DbException?)> getAll({int? limit, int? offset}) async {
    return await handleAction(() => gc.client.category.getAll(limit: limit, offset: offset));
  }
}
