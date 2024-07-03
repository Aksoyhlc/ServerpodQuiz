/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class StreamAction implements _i1.SerializableModel {
  StreamAction._({
    required this.action,
    required this.data,
  });

  factory StreamAction({
    required String action,
    required String data,
  }) = _StreamActionImpl;

  factory StreamAction.fromJson(Map<String, dynamic> jsonSerialization) {
    return StreamAction(
      action: jsonSerialization['action'] as String,
      data: jsonSerialization['data'] as String,
    );
  }

  String action;

  String data;

  StreamAction copyWith({
    String? action,
    String? data,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'action': action,
      'data': data,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StreamActionImpl extends StreamAction {
  _StreamActionImpl({
    required String action,
    required String data,
  }) : super._(
          action: action,
          data: data,
        );

  @override
  StreamAction copyWith({
    String? action,
    String? data,
  }) {
    return StreamAction(
      action: action ?? this.action,
      data: data ?? this.data,
    );
  }
}
