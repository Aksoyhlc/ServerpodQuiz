/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'protocol.dart' as _i3;

abstract class OnlineUser implements _i1.SerializableModel {
  OnlineUser._({
    this.id,
    required this.userId,
    this.user,
    required this.type,
    required this.typeId,
    this.createdAt,
  });

  factory OnlineUser({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    required _i3.QuizResultType type,
    required int typeId,
    DateTime? createdAt,
  }) = _OnlineUserImpl;

  factory OnlineUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return OnlineUser(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      type: _i3.QuizResultType.fromJson((jsonSerialization['type'] as String)),
      typeId: jsonSerialization['typeId'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.UserInfo? user;

  _i3.QuizResultType type;

  int typeId;

  DateTime? createdAt;

  OnlineUser copyWith({
    int? id,
    int? userId,
    _i2.UserInfo? user,
    _i3.QuizResultType? type,
    int? typeId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'type': type.toJson(),
      'typeId': typeId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OnlineUserImpl extends OnlineUser {
  _OnlineUserImpl({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    required _i3.QuizResultType type,
    required int typeId,
    DateTime? createdAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          type: type,
          typeId: typeId,
          createdAt: createdAt,
        );

  @override
  OnlineUser copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    _i3.QuizResultType? type,
    int? typeId,
    Object? createdAt = _Undefined,
  }) {
    return OnlineUser(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserInfo? ? user : this.user?.copyWith(),
      type: type ?? this.type,
      typeId: typeId ?? this.typeId,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}
