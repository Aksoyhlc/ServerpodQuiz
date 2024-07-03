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

abstract class QuizQuestion implements _i1.SerializableModel {
  QuizQuestion._({
    this.id,
    required this.quizId,
    this.quiz,
    required this.questionId,
    this.question,
    required this.createdAt,
  });

  factory QuizQuestion({
    int? id,
    required int quizId,
    _i2.Quiz? quiz,
    required int questionId,
    _i2.Question? question,
    required DateTime createdAt,
  }) = _QuizQuestionImpl;

  factory QuizQuestion.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizQuestion(
      id: jsonSerialization['id'] as int?,
      quizId: jsonSerialization['quizId'] as int,
      quiz: jsonSerialization['quiz'] == null
          ? null
          : _i2.Quiz.fromJson(
              (jsonSerialization['quiz'] as Map<String, dynamic>)),
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

  int quizId;

  _i2.Quiz? quiz;

  int questionId;

  _i2.Question? question;

  DateTime createdAt;

  QuizQuestion copyWith({
    int? id,
    int? quizId,
    _i2.Quiz? quiz,
    int? questionId,
    _i2.Question? question,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'quizId': quizId,
      if (quiz != null) 'quiz': quiz?.toJson(),
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

class _QuizQuestionImpl extends QuizQuestion {
  _QuizQuestionImpl({
    int? id,
    required int quizId,
    _i2.Quiz? quiz,
    required int questionId,
    _i2.Question? question,
    required DateTime createdAt,
  }) : super._(
          id: id,
          quizId: quizId,
          quiz: quiz,
          questionId: questionId,
          question: question,
          createdAt: createdAt,
        );

  @override
  QuizQuestion copyWith({
    Object? id = _Undefined,
    int? quizId,
    Object? quiz = _Undefined,
    int? questionId,
    Object? question = _Undefined,
    DateTime? createdAt,
  }) {
    return QuizQuestion(
      id: id is int? ? id : this.id,
      quizId: quizId ?? this.quizId,
      quiz: quiz is _i2.Quiz? ? quiz : this.quiz?.copyWith(),
      questionId: questionId ?? this.questionId,
      question:
          question is _i2.Question? ? question : this.question?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
