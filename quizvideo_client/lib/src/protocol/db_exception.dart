/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class DbException
    implements _i1.SerializableException, _i1.SerializableModel {
  DbException._({
    required this.message,
    this.stackTrace,
    this.type,
  });

  factory DbException({
    required String message,
    String? stackTrace,
    _i2.ExType? type,
  }) = _DbExceptionImpl;

  factory DbException.fromJson(Map<String, dynamic> jsonSerialization) {
    return DbException(
      message: jsonSerialization['message'] as String,
      stackTrace: jsonSerialization['stackTrace'] as String?,
      type: jsonSerialization['type'] == null
          ? null
          : _i2.ExType.fromJson((jsonSerialization['type'] as String)),
    );
  }

  String message;

  String? stackTrace;

  _i2.ExType? type;

  DbException copyWith({
    String? message,
    String? stackTrace,
    _i2.ExType? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      if (stackTrace != null) 'stackTrace': stackTrace,
      if (type != null) 'type': type?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DbExceptionImpl extends DbException {
  _DbExceptionImpl({
    required String message,
    String? stackTrace,
    _i2.ExType? type,
  }) : super._(
          message: message,
          stackTrace: stackTrace,
          type: type,
        );

  @override
  DbException copyWith({
    String? message,
    Object? stackTrace = _Undefined,
    Object? type = _Undefined,
  }) {
    return DbException(
      message: message ?? this.message,
      stackTrace: stackTrace is String? ? stackTrace : this.stackTrace,
      type: type is _i2.ExType? ? type : this.type,
    );
  }
}
