/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class AdminQuizResult implements _i1.SerializableModel {
  AdminQuizResult._({
    required this.userCount,
    required this.resultCount,
    required this.correctCount,
    required this.wrongCount,
  });

  factory AdminQuizResult({
    required Map<int, int> userCount,
    required Map<int, int> resultCount,
    required Map<int, int> correctCount,
    required Map<int, int> wrongCount,
  }) = _AdminQuizResultImpl;

  factory AdminQuizResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return AdminQuizResult(
      userCount: (jsonSerialization['userCount'] as List).fold<Map<int, int>>(
          {}, (t, e) => {...t, e['k'] as int: e['v'] as int}),
      resultCount: (jsonSerialization['resultCount'] as List)
          .fold<Map<int, int>>(
              {}, (t, e) => {...t, e['k'] as int: e['v'] as int}),
      correctCount: (jsonSerialization['correctCount'] as List)
          .fold<Map<int, int>>(
              {}, (t, e) => {...t, e['k'] as int: e['v'] as int}),
      wrongCount: (jsonSerialization['wrongCount'] as List).fold<Map<int, int>>(
          {}, (t, e) => {...t, e['k'] as int: e['v'] as int}),
    );
  }

  Map<int, int> userCount;

  Map<int, int> resultCount;

  Map<int, int> correctCount;

  Map<int, int> wrongCount;

  AdminQuizResult copyWith({
    Map<int, int>? userCount,
    Map<int, int>? resultCount,
    Map<int, int>? correctCount,
    Map<int, int>? wrongCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userCount': userCount.toJson(),
      'resultCount': resultCount.toJson(),
      'correctCount': correctCount.toJson(),
      'wrongCount': wrongCount.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AdminQuizResultImpl extends AdminQuizResult {
  _AdminQuizResultImpl({
    required Map<int, int> userCount,
    required Map<int, int> resultCount,
    required Map<int, int> correctCount,
    required Map<int, int> wrongCount,
  }) : super._(
          userCount: userCount,
          resultCount: resultCount,
          correctCount: correctCount,
          wrongCount: wrongCount,
        );

  @override
  AdminQuizResult copyWith({
    Map<int, int>? userCount,
    Map<int, int>? resultCount,
    Map<int, int>? correctCount,
    Map<int, int>? wrongCount,
  }) {
    return AdminQuizResult(
      userCount: userCount ?? this.userCount.clone(),
      resultCount: resultCount ?? this.resultCount.clone(),
      correctCount: correctCount ?? this.correctCount.clone(),
      wrongCount: wrongCount ?? this.wrongCount.clone(),
    );
  }
}
