/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class CompetitionAnswer
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CompetitionAnswer._({
    required this.competition,
    required this.question,
    required this.answer,
    this.user1Answer,
    this.user2Answer,
    this.user1IsCorrect,
    this.user2IsCorrect,
  });

  factory CompetitionAnswer({
    required _i2.Competition competition,
    required _i2.Question question,
    required String answer,
    String? user1Answer,
    String? user2Answer,
    bool? user1IsCorrect,
    bool? user2IsCorrect,
  }) = _CompetitionAnswerImpl;

  factory CompetitionAnswer.fromJson(Map<String, dynamic> jsonSerialization) {
    return CompetitionAnswer(
      competition: _i2.Competition.fromJson(
          (jsonSerialization['competition'] as Map<String, dynamic>)),
      question: _i2.Question.fromJson(
          (jsonSerialization['question'] as Map<String, dynamic>)),
      answer: jsonSerialization['answer'] as String,
      user1Answer: jsonSerialization['user1Answer'] as String?,
      user2Answer: jsonSerialization['user2Answer'] as String?,
      user1IsCorrect: jsonSerialization['user1IsCorrect'] as bool?,
      user2IsCorrect: jsonSerialization['user2IsCorrect'] as bool?,
    );
  }

  _i2.Competition competition;

  _i2.Question question;

  String answer;

  String? user1Answer;

  String? user2Answer;

  bool? user1IsCorrect;

  bool? user2IsCorrect;

  CompetitionAnswer copyWith({
    _i2.Competition? competition,
    _i2.Question? question,
    String? answer,
    String? user1Answer,
    String? user2Answer,
    bool? user1IsCorrect,
    bool? user2IsCorrect,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'competition': competition.toJson(),
      'question': question.toJson(),
      'answer': answer,
      if (user1Answer != null) 'user1Answer': user1Answer,
      if (user2Answer != null) 'user2Answer': user2Answer,
      if (user1IsCorrect != null) 'user1IsCorrect': user1IsCorrect,
      if (user2IsCorrect != null) 'user2IsCorrect': user2IsCorrect,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'competition': competition.toJsonForProtocol(),
      'question': question.toJsonForProtocol(),
      'answer': answer,
      if (user1Answer != null) 'user1Answer': user1Answer,
      if (user2Answer != null) 'user2Answer': user2Answer,
      if (user1IsCorrect != null) 'user1IsCorrect': user1IsCorrect,
      if (user2IsCorrect != null) 'user2IsCorrect': user2IsCorrect,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CompetitionAnswerImpl extends CompetitionAnswer {
  _CompetitionAnswerImpl({
    required _i2.Competition competition,
    required _i2.Question question,
    required String answer,
    String? user1Answer,
    String? user2Answer,
    bool? user1IsCorrect,
    bool? user2IsCorrect,
  }) : super._(
          competition: competition,
          question: question,
          answer: answer,
          user1Answer: user1Answer,
          user2Answer: user2Answer,
          user1IsCorrect: user1IsCorrect,
          user2IsCorrect: user2IsCorrect,
        );

  @override
  CompetitionAnswer copyWith({
    _i2.Competition? competition,
    _i2.Question? question,
    String? answer,
    Object? user1Answer = _Undefined,
    Object? user2Answer = _Undefined,
    Object? user1IsCorrect = _Undefined,
    Object? user2IsCorrect = _Undefined,
  }) {
    return CompetitionAnswer(
      competition: competition ?? this.competition.copyWith(),
      question: question ?? this.question.copyWith(),
      answer: answer ?? this.answer,
      user1Answer: user1Answer is String? ? user1Answer : this.user1Answer,
      user2Answer: user2Answer is String? ? user2Answer : this.user2Answer,
      user1IsCorrect:
          user1IsCorrect is bool? ? user1IsCorrect : this.user1IsCorrect,
      user2IsCorrect:
          user2IsCorrect is bool? ? user2IsCorrect : this.user2IsCorrect,
    );
  }
}
