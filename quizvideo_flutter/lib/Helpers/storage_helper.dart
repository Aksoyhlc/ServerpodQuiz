import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  StorageHelper._();
  factory StorageHelper() => _singleton;
  static final StorageHelper _singleton = StorageHelper._();

  final storage = const FlutterSecureStorage();

  Future<void> write(String key, dynamic value) async {
    await storage.write(key: key, value: value);
  }

  Future<dynamic> read(String key) async {
    return await storage.read(key: key);
  }

  Future<void> remove(String key) async {
    await storage.delete(key: key);
  }
}
