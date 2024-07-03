import 'package:serverpod/serverpod.dart';

class CacheModel<T extends SerializableModel?> implements SerializableModel {
  List<T?>? value;

  CacheModel({this.value});

  @override
  Map<String, dynamic> toJson() {
    // Convert the list of items to JSON
    List<Map<String, dynamic>> list = [];

    if (value != null) {
      value?.forEach((item) {
        if (item != null) {
          list.add(item.toJson());
        }
      });
    }

    return {
      'cache': list,
    };
  }
}
