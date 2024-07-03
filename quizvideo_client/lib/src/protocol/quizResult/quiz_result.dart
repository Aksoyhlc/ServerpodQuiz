/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class QuizResult implements _i1.SerializableModel {
  QuizResult._({
    this.id,
    required this.typeId,
    this.userId,
    required this.type,
    required this.correctCount,
    required this.wrongCount,
    required this.passedCount,
    required this.point,
    this.createdAt,
    this.startedAt,
    this.endAt,
    this.typeText,
  });

  factory QuizResult({
    int? id,
    required int typeId,
    int? userId,
    required _i2.QuizResultType type,
    required int correctCount,
    required int wrongCount,
    required int passedCount,
    required int point,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? endAt,
    String? typeText,
  }) = _QuizResultImpl;

  factory QuizResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizResult(
      id: jsonSerialization['id'] as int?,
      typeId: jsonSerialization['typeId'] as int,
      userId: jsonSerialization['userId'] as int?,
      type: _i2.QuizResultType.fromJson((jsonSerialization['type'] as String)),
      correctCount: jsonSerialization['correctCount'] as int,
      wrongCount: jsonSerialization['wrongCount'] as int,
      passedCount: jsonSerialization['passedCount'] as int,
      point: jsonSerialization['point'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      startedAt: jsonSerialization['startedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startedAt']),
      endAt: jsonSerialization['endAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endAt']),
      typeText: jsonSerialization['typeText'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int typeId;

  int? userId;

  _i2.QuizResultType type;

  int correctCount;

  int wrongCount;

  int passedCount;

  int point;

  DateTime? createdAt;

  DateTime? startedAt;

  DateTime? endAt;

  String? typeText;

  QuizResult copyWith({
    int? id,
    int? typeId,
    int? userId,
    _i2.QuizResultType? type,
    int? correctCount,
    int? wrongCount,
    int? passedCount,
    int? point,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? endAt,
    String? typeText,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'typeId': typeId,
      if (userId != null) 'userId': userId,
      'type': type.toJson(),
      'correctCount': correctCount,
      'wrongCount': wrongCount,
      'passedCount': passedCount,
      'point': point,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (endAt != null) 'endAt': endAt?.toJson(),
      if (typeText != null) 'typeText': typeText,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizResultImpl extends QuizResult {
  _QuizResultImpl({
    int? id,
    required int typeId,
    int? userId,
    required _i2.QuizResultType type,
    required int correctCount,
    required int wrongCount,
    required int passedCount,
    required int point,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? endAt,
    String? typeText,
  }) : super._(
          id: id,
          typeId: typeId,
          userId: userId,
          type: type,
          correctCount: correctCount,
          wrongCount: wrongCount,
          passedCount: passedCount,
          point: point,
          createdAt: createdAt,
          startedAt: startedAt,
          endAt: endAt,
          typeText: typeText,
        );

  @override
  QuizResult copyWith({
    Object? id = _Undefined,
    int? typeId,
    Object? userId = _Undefined,
    _i2.QuizResultType? type,
    int? correctCount,
    int? wrongCount,
    int? passedCount,
    int? point,
    Object? createdAt = _Undefined,
    Object? startedAt = _Undefined,
    Object? endAt = _Undefined,
    Object? typeText = _Undefined,
  }) {
    return QuizResult(
      id: id is int? ? id : this.id,
      typeId: typeId ?? this.typeId,
      userId: userId is int? ? userId : this.userId,
      type: type ?? this.type,
      correctCount: correctCount ?? this.correctCount,
      wrongCount: wrongCount ?? this.wrongCount,
      passedCount: passedCount ?? this.passedCount,
      point: point ?? this.point,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      startedAt: startedAt is DateTime? ? startedAt : this.startedAt,
      endAt: endAt is DateTime? ? endAt : this.endAt,
      typeText: typeText is String? ? typeText : this.typeText,
    );
  }
}
