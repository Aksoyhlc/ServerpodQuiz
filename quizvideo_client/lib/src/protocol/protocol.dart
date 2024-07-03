/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'category/category.dart' as _i2;
import 'category/category_question.dart' as _i3;
import 'competition/answer_check.dart' as _i4;
import 'competition/competition.dart' as _i5;
import 'competition/competition_answer_model.dart' as _i6;
import 'db_exception.dart' as _i7;
import 'db_exception_status.dart' as _i8;
import 'example.dart' as _i9;
import 'online_user.dart' as _i10;
import 'question/question.dart' as _i11;
import 'question/quiz_question.dart' as _i12;
import 'quiz/quiz.dart' as _i13;
import 'quiz/quiz_status.dart' as _i14;
import 'quiz/quiz_type.dart' as _i15;
import 'quizResult/admin_quiz_result.dart' as _i16;
import 'quizResult/quiz_result.dart' as _i17;
import 'quizResult/quiz_result_type.dart' as _i18;
import 'stream_action.dart' as _i19;
import 'user.dart' as _i20;
import 'protocol.dart' as _i21;
import 'package:quizvideo_client/src/protocol/category/category.dart' as _i22;
import 'package:quizvideo_client/src/protocol/question/question.dart' as _i23;
import 'package:quizvideo_client/src/protocol/quiz/quiz.dart' as _i24;
import 'package:quizvideo_client/src/protocol/quizResult/quiz_result.dart'
    as _i25;
import 'package:quizvideo_client/src/protocol/user.dart' as _i26;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i27;
export 'category/category.dart';
export 'category/category_question.dart';
export 'competition/answer_check.dart';
export 'competition/competition.dart';
export 'competition/competition_answer_model.dart';
export 'db_exception.dart';
export 'db_exception_status.dart';
export 'example.dart';
export 'online_user.dart';
export 'question/question.dart';
export 'question/quiz_question.dart';
export 'quiz/quiz.dart';
export 'quiz/quiz_status.dart';
export 'quiz/quiz_type.dart';
export 'quizResult/admin_quiz_result.dart';
export 'quizResult/quiz_result.dart';
export 'quizResult/quiz_result_type.dart';
export 'stream_action.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Category) {
      return _i2.Category.fromJson(data) as T;
    }
    if (t == _i3.CategoryQuestion) {
      return _i3.CategoryQuestion.fromJson(data) as T;
    }
    if (t == _i4.AnswerCheck) {
      return _i4.AnswerCheck.fromJson(data) as T;
    }
    if (t == _i5.Competition) {
      return _i5.Competition.fromJson(data) as T;
    }
    if (t == _i6.CompetitionAnswer) {
      return _i6.CompetitionAnswer.fromJson(data) as T;
    }
    if (t == _i7.DbException) {
      return _i7.DbException.fromJson(data) as T;
    }
    if (t == _i8.ExType) {
      return _i8.ExType.fromJson(data) as T;
    }
    if (t == _i9.Example) {
      return _i9.Example.fromJson(data) as T;
    }
    if (t == _i10.OnlineUser) {
      return _i10.OnlineUser.fromJson(data) as T;
    }
    if (t == _i11.Question) {
      return _i11.Question.fromJson(data) as T;
    }
    if (t == _i12.QuizQuestion) {
      return _i12.QuizQuestion.fromJson(data) as T;
    }
    if (t == _i13.Quiz) {
      return _i13.Quiz.fromJson(data) as T;
    }
    if (t == _i14.QuizStatus) {
      return _i14.QuizStatus.fromJson(data) as T;
    }
    if (t == _i15.QuizType) {
      return _i15.QuizType.fromJson(data) as T;
    }
    if (t == _i16.AdminQuizResult) {
      return _i16.AdminQuizResult.fromJson(data) as T;
    }
    if (t == _i17.QuizResult) {
      return _i17.QuizResult.fromJson(data) as T;
    }
    if (t == _i18.QuizResultType) {
      return _i18.QuizResultType.fromJson(data) as T;
    }
    if (t == _i19.StreamAction) {
      return _i19.StreamAction.fromJson(data) as T;
    }
    if (t == _i20.User) {
      return _i20.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Category?>()) {
      return (data != null ? _i2.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CategoryQuestion?>()) {
      return (data != null ? _i3.CategoryQuestion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AnswerCheck?>()) {
      return (data != null ? _i4.AnswerCheck.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Competition?>()) {
      return (data != null ? _i5.Competition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CompetitionAnswer?>()) {
      return (data != null ? _i6.CompetitionAnswer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.DbException?>()) {
      return (data != null ? _i7.DbException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ExType?>()) {
      return (data != null ? _i8.ExType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Example?>()) {
      return (data != null ? _i9.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.OnlineUser?>()) {
      return (data != null ? _i10.OnlineUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Question?>()) {
      return (data != null ? _i11.Question.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.QuizQuestion?>()) {
      return (data != null ? _i12.QuizQuestion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Quiz?>()) {
      return (data != null ? _i13.Quiz.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.QuizStatus?>()) {
      return (data != null ? _i14.QuizStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.QuizType?>()) {
      return (data != null ? _i15.QuizType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.AdminQuizResult?>()) {
      return (data != null ? _i16.AdminQuizResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.QuizResult?>()) {
      return (data != null ? _i17.QuizResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.QuizResultType?>()) {
      return (data != null ? _i18.QuizResultType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.StreamAction?>()) {
      return (data != null ? _i19.StreamAction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.User?>()) {
      return (data != null ? _i20.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<int?>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int?>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i21.CategoryQuestion>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i21.CategoryQuestion>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i21.Question>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i21.Question>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i21.CategoryQuestion>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i21.CategoryQuestion>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i21.QuizQuestion>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i21.QuizQuestion>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i21.QuizQuestion>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i21.QuizQuestion>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == Map<int, int>) {
      return Map.fromEntries((data as List).map((e) =>
              MapEntry(deserialize<int>(e['k']), deserialize<int>(e['v']))))
          as dynamic;
    }
    if (t == _i1.getType<List<_i22.Category>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i22.Category>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i23.Question?>) {
      return (data as List).map((e) => deserialize<_i23.Question?>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i23.Question>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i23.Question>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i24.Quiz>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i24.Quiz>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i25.QuizResult>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i25.QuizResult>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i26.User>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i26.User>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i26.User>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i26.User>(e)).toList()
          : null) as dynamic;
    }
    try {
      return _i27.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i27.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Category) {
      return 'Category';
    }
    if (data is _i3.CategoryQuestion) {
      return 'CategoryQuestion';
    }
    if (data is _i4.AnswerCheck) {
      return 'AnswerCheck';
    }
    if (data is _i5.Competition) {
      return 'Competition';
    }
    if (data is _i6.CompetitionAnswer) {
      return 'CompetitionAnswer';
    }
    if (data is _i7.DbException) {
      return 'DbException';
    }
    if (data is _i8.ExType) {
      return 'ExType';
    }
    if (data is _i9.Example) {
      return 'Example';
    }
    if (data is _i10.OnlineUser) {
      return 'OnlineUser';
    }
    if (data is _i11.Question) {
      return 'Question';
    }
    if (data is _i12.QuizQuestion) {
      return 'QuizQuestion';
    }
    if (data is _i13.Quiz) {
      return 'Quiz';
    }
    if (data is _i14.QuizStatus) {
      return 'QuizStatus';
    }
    if (data is _i15.QuizType) {
      return 'QuizType';
    }
    if (data is _i16.AdminQuizResult) {
      return 'AdminQuizResult';
    }
    if (data is _i17.QuizResult) {
      return 'QuizResult';
    }
    if (data is _i18.QuizResultType) {
      return 'QuizResultType';
    }
    if (data is _i19.StreamAction) {
      return 'StreamAction';
    }
    if (data is _i20.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i27.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Category') {
      return deserialize<_i2.Category>(data['data']);
    }
    if (data['className'] == 'CategoryQuestion') {
      return deserialize<_i3.CategoryQuestion>(data['data']);
    }
    if (data['className'] == 'AnswerCheck') {
      return deserialize<_i4.AnswerCheck>(data['data']);
    }
    if (data['className'] == 'Competition') {
      return deserialize<_i5.Competition>(data['data']);
    }
    if (data['className'] == 'CompetitionAnswer') {
      return deserialize<_i6.CompetitionAnswer>(data['data']);
    }
    if (data['className'] == 'DbException') {
      return deserialize<_i7.DbException>(data['data']);
    }
    if (data['className'] == 'ExType') {
      return deserialize<_i8.ExType>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i9.Example>(data['data']);
    }
    if (data['className'] == 'OnlineUser') {
      return deserialize<_i10.OnlineUser>(data['data']);
    }
    if (data['className'] == 'Question') {
      return deserialize<_i11.Question>(data['data']);
    }
    if (data['className'] == 'QuizQuestion') {
      return deserialize<_i12.QuizQuestion>(data['data']);
    }
    if (data['className'] == 'Quiz') {
      return deserialize<_i13.Quiz>(data['data']);
    }
    if (data['className'] == 'QuizStatus') {
      return deserialize<_i14.QuizStatus>(data['data']);
    }
    if (data['className'] == 'QuizType') {
      return deserialize<_i15.QuizType>(data['data']);
    }
    if (data['className'] == 'AdminQuizResult') {
      return deserialize<_i16.AdminQuizResult>(data['data']);
    }
    if (data['className'] == 'QuizResult') {
      return deserialize<_i17.QuizResult>(data['data']);
    }
    if (data['className'] == 'QuizResultType') {
      return deserialize<_i18.QuizResultType>(data['data']);
    }
    if (data['className'] == 'StreamAction') {
      return deserialize<_i19.StreamAction>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i20.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
