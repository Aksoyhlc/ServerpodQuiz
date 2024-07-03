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

abstract class Question implements _i1.SerializableModel {
  Question._({
    this.id,
    required this.content,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.answer,
    required this.point,
    this.createdAt,
    this.updatedAt,
    this.categoryIds,
    this.categories,
    this.quizs,
  });

  factory Question({
    int? id,
    required String content,
    required String a,
    required String b,
    required String c,
    required String d,
    required String answer,
    required int point,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? categoryIds,
    List<_i2.CategoryQuestion>? categories,
    List<_i2.QuizQuestion>? quizs,
  }) = _QuestionImpl;

  factory Question.fromJson(Map<String, dynamic> jsonSerialization) {
    return Question(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      a: jsonSerialization['a'] as String,
      b: jsonSerialization['b'] as String,
      c: jsonSerialization['c'] as String,
      d: jsonSerialization['d'] as String,
      answer: jsonSerialization['answer'] as String,
      point: jsonSerialization['point'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      categoryIds: (jsonSerialization['categoryIds'] as List?)
          ?.map((e) => e as String)
          .toList(),
      categories: (jsonSerialization['categories'] as List?)
          ?.map(
              (e) => _i2.CategoryQuestion.fromJson((e as Map<String, dynamic>)))
          .toList(),
      quizs: (jsonSerialization['quizs'] as List?)
          ?.map((e) => _i2.QuizQuestion.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String content;

  String a;

  String b;

  String c;

  String d;

  String answer;

  int point;

  DateTime? createdAt;

  DateTime? updatedAt;

  List<String>? categoryIds;

  List<_i2.CategoryQuestion>? categories;

  List<_i2.QuizQuestion>? quizs;

  Question copyWith({
    int? id,
    String? content,
    String? a,
    String? b,
    String? c,
    String? d,
    String? answer,
    int? point,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? categoryIds,
    List<_i2.CategoryQuestion>? categories,
    List<_i2.QuizQuestion>? quizs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'a': a,
      'b': b,
      'c': c,
      'd': d,
      'answer': answer,
      'point': point,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (categoryIds != null) 'categoryIds': categoryIds?.toJson(),
      if (categories != null)
        'categories': categories?.toJson(valueToJson: (v) => v.toJson()),
      if (quizs != null) 'quizs': quizs?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuestionImpl extends Question {
  _QuestionImpl({
    int? id,
    required String content,
    required String a,
    required String b,
    required String c,
    required String d,
    required String answer,
    required int point,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? categoryIds,
    List<_i2.CategoryQuestion>? categories,
    List<_i2.QuizQuestion>? quizs,
  }) : super._(
          id: id,
          content: content,
          a: a,
          b: b,
          c: c,
          d: d,
          answer: answer,
          point: point,
          createdAt: createdAt,
          updatedAt: updatedAt,
          categoryIds: categoryIds,
          categories: categories,
          quizs: quizs,
        );

  @override
  Question copyWith({
    Object? id = _Undefined,
    String? content,
    String? a,
    String? b,
    String? c,
    String? d,
    String? answer,
    int? point,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
    Object? categoryIds = _Undefined,
    Object? categories = _Undefined,
    Object? quizs = _Undefined,
  }) {
    return Question(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      a: a ?? this.a,
      b: b ?? this.b,
      c: c ?? this.c,
      d: d ?? this.d,
      answer: answer ?? this.answer,
      point: point ?? this.point,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      categoryIds: categoryIds is List<String>?
          ? categoryIds
          : this.categoryIds?.clone(),
      categories: categories is List<_i2.CategoryQuestion>?
          ? categories
          : this.categories?.clone(),
      quizs: quizs is List<_i2.QuizQuestion>? ? quizs : this.quizs?.clone(),
    );
  }
}
