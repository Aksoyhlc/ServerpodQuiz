import 'package:quizvideo_server/src/generated/db_exception.dart';
import 'package:serverpod/serverpod.dart';

mixin DatabaseHelper {
  Future<T?> handleAction<T>(Session session, Future<T?> Function() operation) async {
    try {
      var result = await operation();
      return (result);
    } on DbException catch (e, s) {
      session.log(
        e.toString(),
        exception: e,
        stackTrace: s,
        level: LogLevel.error,
      );
      rethrow;
    } catch (e, s) {
      session.log(
        e.toString(),
        exception: e,
        stackTrace: s,
        level: LogLevel.error,
      );
      throw DbException(message: e.toString(), stackTrace: s.toString());
    }
  }
}
