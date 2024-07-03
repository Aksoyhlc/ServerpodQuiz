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

abstract class AnswerCheck implements _i1.SerializableModel {
  AnswerCheck._({
    required this.competitionAnswer,
    required this.thisUser,
    this.otherAnswer,
  });

  factory AnswerCheck({
    required _i2.CompetitionAnswer competitionAnswer,
    required int thisUser,
    String? otherAnswer,
  }) = _AnswerCheckImpl;

  factory AnswerCheck.fromJson(Map<String, dynamic> jsonSerialization) {
    return AnswerCheck(
      competitionAnswer: _i2.CompetitionAnswer.fromJson(
          (jsonSerialization['competitionAnswer'] as Map<String, dynamic>)),
      thisUser: jsonSerialization['thisUser'] as int,
      otherAnswer: jsonSerialization['otherAnswer'] as String?,
    );
  }

  _i2.CompetitionAnswer competitionAnswer;

  int thisUser;

  String? otherAnswer;

  AnswerCheck copyWith({
    _i2.CompetitionAnswer? competitionAnswer,
    int? thisUser,
    String? otherAnswer,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'competitionAnswer': competitionAnswer.toJson(),
      'thisUser': thisUser,
      if (otherAnswer != null) 'otherAnswer': otherAnswer,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AnswerCheckImpl extends AnswerCheck {
  _AnswerCheckImpl({
    required _i2.CompetitionAnswer competitionAnswer,
    required int thisUser,
    String? otherAnswer,
  }) : super._(
          competitionAnswer: competitionAnswer,
          thisUser: thisUser,
          otherAnswer: otherAnswer,
        );

  @override
  AnswerCheck copyWith({
    _i2.CompetitionAnswer? competitionAnswer,
    int? thisUser,
    Object? otherAnswer = _Undefined,
  }) {
    return AnswerCheck(
      competitionAnswer: competitionAnswer ?? this.competitionAnswer.copyWith(),
      thisUser: thisUser ?? this.thisUser,
      otherAnswer: otherAnswer is String? ? otherAnswer : this.otherAnswer,
    );
  }
}
