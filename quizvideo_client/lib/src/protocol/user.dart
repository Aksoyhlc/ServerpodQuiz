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

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.name,
    required this.userInfoId,
    this.userInfo,
    this.point,
    this.password,
  });

  factory User({
    int? id,
    required String name,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    String? point,
    String? password,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      point: jsonSerialization['point'] as String?,
      password: jsonSerialization['password'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int userInfoId;

  _i2.UserInfo? userInfo;

  String? point;

  String? password;

  User copyWith({
    int? id,
    String? name,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? point,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (point != null) 'point': point,
      if (password != null) 'password': password,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String name,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    String? point,
    String? password,
  }) : super._(
          id: id,
          name: name,
          userInfoId: userInfoId,
          userInfo: userInfo,
          point: point,
          password: password,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    String? name,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? point = _Undefined,
    Object? password = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      point: point is String? ? point : this.point,
      password: password is String? ? password : this.password,
    );
  }
}
