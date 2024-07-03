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

abstract class CategoryQuestion implements _i1.SerializableModel {
  CategoryQuestion._({
    this.id,
    required this.categoryId,
    this.category,
    required this.questionId,
    this.question,
    required this.createdAt,
  });

  factory CategoryQuestion({
    int? id,
    required int categoryId,
    _i2.Category? category,
    required int questionId,
    _i2.Question? question,
    required DateTime createdAt,
  }) = _CategoryQuestionImpl;

  factory CategoryQuestion.fromJson(Map<String, dynamic> jsonSerialization) {
    return CategoryQuestion(
      id: jsonSerialization['id'] as int?,
      categoryId: jsonSerialization['categoryId'] as int,
      category: jsonSerialization['category'] == null
          ? null
          : _i2.Category.fromJson(
              (jsonSerialization['category'] as Map<String, dynamic>)),
      questionId: jsonSerialization['questionId'] as int,
      question: jsonSerialization['question'] == null
          ? null
          : _i2.Question.fromJson(
              (jsonSerialization['question'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int categoryId;

  _i2.Category? category;

  int questionId;

  _i2.Question? question;

  DateTime createdAt;

  CategoryQuestion copyWith({
    int? id,
    int? categoryId,
    _i2.Category? category,
    int? questionId,
    _i2.Question? question,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'categoryId': categoryId,
      if (category != null) 'category': category?.toJson(),
      'questionId': questionId,
      if (question != null) 'question': question?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategoryQuestionImpl extends CategoryQuestion {
  _CategoryQuestionImpl({
    int? id,
    required int categoryId,
    _i2.Category? category,
    required int questionId,
    _i2.Question? question,
    required DateTime createdAt,
  }) : super._(
          id: id,
          categoryId: categoryId,
          category: category,
          questionId: questionId,
          question: question,
          createdAt: createdAt,
        );

  @override
  CategoryQuestion copyWith({
    Object? id = _Undefined,
    int? categoryId,
    Object? category = _Undefined,
    int? questionId,
    Object? question = _Undefined,
    DateTime? createdAt,
  }) {
    return CategoryQuestion(
      id: id is int? ? id : this.id,
      categoryId: categoryId ?? this.categoryId,
      category:
          category is _i2.Category? ? category : this.category?.copyWith(),
      questionId: questionId ?? this.questionId,
      question:
          question is _i2.Question? ? question : this.question?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
