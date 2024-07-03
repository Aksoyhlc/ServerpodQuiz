import 'package:serverpod/serverpod.dart';

abstract class IDatabaseEndpoint<T> {
  Future<List<T?>?> getAll(Session session, {int? limit, int? offset});

  Future<T?> getById(Session session, int id);

  Future<T?> add(Session session, T data);

  Future<T?> update(Session session, T data);

  Future<T?> delete(Session session, T data);
}
