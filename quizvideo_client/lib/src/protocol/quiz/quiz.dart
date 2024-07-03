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

abstract class Quiz implements _i1.SerializableModel {
  Quiz._({
    this.id,
    this.title,
    this.description,
    this.questions,
    this.questionsIds,
    this.time,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.type,
    this.user,
  });

  factory Quiz({
    int? id,
    String? title,
    String? description,
    List<_i2.QuizQuestion>? questions,
    List<String>? questionsIds,
    int? time,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.QuizStatus? status,
    _i2.QuizType? type,
    _i2.User? user,
  }) = _QuizImpl;

  factory Quiz.fromJson(Map<String, dynamic> jsonSerialization) {
    return Quiz(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String?,
      description: jsonSerialization['description'] as String?,
      questions: (jsonSerialization['questions'] as List?)
          ?.map((e) => _i2.QuizQuestion.fromJson((e as Map<String, dynamic>)))
          .toList(),
      questionsIds: (jsonSerialization['questionsIds'] as List?)
          ?.map((e) => e as String)
          .toList(),
      time: jsonSerialization['time'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      status: jsonSerialization['status'] == null
          ? null
          : _i2.QuizStatus.fromJson((jsonSerialization['status'] as String)),
      type: jsonSerialization['type'] == null
          ? null
          : _i2.QuizType.fromJson((jsonSerialization['type'] as String)),
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? title;

  String? description;

  List<_i2.QuizQuestion>? questions;

  List<String>? questionsIds;

  int? time;

  DateTime? createdAt;

  DateTime? updatedAt;

  _i2.QuizStatus? status;

  _i2.QuizType? type;

  _i2.User? user;

  Quiz copyWith({
    int? id,
    String? title,
    String? description,
    List<_i2.QuizQuestion>? questions,
    List<String>? questionsIds,
    int? time,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.QuizStatus? status,
    _i2.QuizType? type,
    _i2.User? user,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (questions != null)
        'questions': questions?.toJson(valueToJson: (v) => v.toJson()),
      if (questionsIds != null) 'questionsIds': questionsIds?.toJson(),
      if (time != null) 'time': time,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (status != null) 'status': status?.toJson(),
      if (type != null) 'type': type?.toJson(),
      if (user != null) 'user': user?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizImpl extends Quiz {
  _QuizImpl({
    int? id,
    String? title,
    String? description,
    List<_i2.QuizQuestion>? questions,
    List<String>? questionsIds,
    int? time,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.QuizStatus? status,
    _i2.QuizType? type,
    _i2.User? user,
  }) : super._(
          id: id,
          title: title,
          description: description,
          questions: questions,
          questionsIds: questionsIds,
          time: time,
          createdAt: createdAt,
          updatedAt: updatedAt,
          status: status,
          type: type,
          user: user,
        );

  @override
  Quiz copyWith({
    Object? id = _Undefined,
    Object? title = _Undefined,
    Object? description = _Undefined,
    Object? questions = _Undefined,
    Object? questionsIds = _Undefined,
    Object? time = _Undefined,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
    Object? status = _Undefined,
    Object? type = _Undefined,
    Object? user = _Undefined,
  }) {
    return Quiz(
      id: id is int? ? id : this.id,
      title: title is String? ? title : this.title,
      description: description is String? ? description : this.description,
      questions: questions is List<_i2.QuizQuestion>?
          ? questions
          : this.questions?.clone(),
      questionsIds: questionsIds is List<String>?
          ? questionsIds
          : this.questionsIds?.clone(),
      time: time is int? ? time : this.time,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      status: status is _i2.QuizStatus? ? status : this.status,
      type: type is _i2.QuizType? ? type : this.type,
      user: user is _i2.User? ? user : this.user?.copyWith(),
    );
  }
}
