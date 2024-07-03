import 'package:quizvideo_client/quizvideo_client.dart';

mixin DbHelper {
  Future<(T?, DbException?)> handleAction<T>(Future<T?> Function() operation) async {
    try {
      var result = await operation();
      return (result, null);
    } on DbException catch (e, s) {
      e.type ??= ExType.Error;
      return (null, e);
    } catch (e, s) {
      return (
        null,
        DbException(
          message: e.toString(),
          stackTrace: s.toString(),
          type: ExType.Error,
        )
      );
    }
  }
}
