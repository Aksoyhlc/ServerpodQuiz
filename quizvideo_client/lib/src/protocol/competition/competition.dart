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
import '../protocol.dart' as _i3;

abstract class Competition implements _i1.SerializableModel {
  Competition._({
    this.id,
    required this.identifier,
    required this.user1Id,
    this.user1,
    required this.user2Id,
    this.user2,
    required this.type,
    required this.typeId,
    this.createdAt,
    this.questions,
  });

  factory Competition({
    int? id,
    required _i1.UuidValue identifier,
    required int user1Id,
    _i2.UserInfo? user1,
    required int user2Id,
    _i2.UserInfo? user2,
    required _i3.QuizResultType type,
    required int typeId,
    DateTime? createdAt,
    List<_i3.Question>? questions,
  }) = _CompetitionImpl;

  factory Competition.fromJson(Map<String, dynamic> jsonSerialization) {
    return Competition(
      id: jsonSerialization['id'] as int?,
      identifier:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['identifier']),
      user1Id: jsonSerialization['user1Id'] as int,
      user1: jsonSerialization['user1'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user1'] as Map<String, dynamic>)),
      user2Id: jsonSerialization['user2Id'] as int,
      user2: jsonSerialization['user2'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user2'] as Map<String, dynamic>)),
      type: _i3.QuizResultType.fromJson((jsonSerialization['type'] as String)),
      typeId: jsonSerialization['typeId'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      questions: (jsonSerialization['questions'] as List?)
          ?.map((e) => _i3.Question.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue identifier;

  int user1Id;

  _i2.UserInfo? user1;

  int user2Id;

  _i2.UserInfo? user2;

  _i3.QuizResultType type;

  int typeId;

  DateTime? createdAt;

  List<_i3.Question>? questions;

  Competition copyWith({
    int? id,
    _i1.UuidValue? identifier,
    int? user1Id,
    _i2.UserInfo? user1,
    int? user2Id,
    _i2.UserInfo? user2,
    _i3.QuizResultType? type,
    int? typeId,
    DateTime? createdAt,
    List<_i3.Question>? questions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'identifier': identifier.toJson(),
      'user1Id': user1Id,
      if (user1 != null) 'user1': user1?.toJson(),
      'user2Id': user2Id,
      if (user2 != null) 'user2': user2?.toJson(),
      'type': type.toJson(),
      'typeId': typeId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (questions != null)
        'questions': questions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CompetitionImpl extends Competition {
  _CompetitionImpl({
    int? id,
    required _i1.UuidValue identifier,
    required int user1Id,
    _i2.UserInfo? user1,
    required int user2Id,
    _i2.UserInfo? user2,
    required _i3.QuizResultType type,
    required int typeId,
    DateTime? createdAt,
    List<_i3.Question>? questions,
  }) : super._(
          id: id,
          identifier: identifier,
          user1Id: user1Id,
          user1: user1,
          user2Id: user2Id,
          user2: user2,
          type: type,
          typeId: typeId,
          createdAt: createdAt,
          questions: questions,
        );

  @override
  Competition copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? identifier,
    int? user1Id,
    Object? user1 = _Undefined,
    int? user2Id,
    Object? user2 = _Undefined,
    _i3.QuizResultType? type,
    int? typeId,
    Object? createdAt = _Undefined,
    Object? questions = _Undefined,
  }) {
    return Competition(
      id: id is int? ? id : this.id,
      identifier: identifier ?? this.identifier,
      user1Id: user1Id ?? this.user1Id,
      user1: user1 is _i2.UserInfo? ? user1 : this.user1?.copyWith(),
      user2Id: user2Id ?? this.user2Id,
      user2: user2 is _i2.UserInfo? ? user2 : this.user2?.copyWith(),
      type: type ?? this.type,
      typeId: typeId ?? this.typeId,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      questions: questions is List<_i3.Question>?
          ? questions
          : this.questions?.clone(),
    );
  }
}
