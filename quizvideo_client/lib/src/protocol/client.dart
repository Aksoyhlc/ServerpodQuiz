/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:quizvideo_client/src/protocol/category/category.dart' as _i3;
import 'package:quizvideo_client/src/protocol/question/question.dart' as _i4;
import 'package:quizvideo_client/src/protocol/competition/answer_check.dart'
    as _i5;
import 'package:quizvideo_client/src/protocol/online_user.dart' as _i6;
import 'package:quizvideo_client/src/protocol/quiz/quiz.dart' as _i7;
import 'package:quizvideo_client/src/protocol/quizResult/quiz_result.dart'
    as _i8;
import 'package:quizvideo_client/src/protocol/user.dart' as _i9;
import 'package:quizvideo_client/src/protocol/quizResult/admin_quiz_result.dart'
    as _i10;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i11;
import 'protocol.dart' as _i12;

/// {@category Endpoint}
class EndpointCategory extends _i1.EndpointRef {
  EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  _i2.Future<List<_i3.Category>?> getAll({
    int? limit,
    int? offset,
  }) =>
      caller.callServerEndpoint<List<_i3.Category>?>(
        'category',
        'getAll',
        {
          'limit': limit,
          'offset': offset,
        },
      );

  _i2.Future<_i3.Category?> getById(int? id) =>
      caller.callServerEndpoint<_i3.Category?>(
        'category',
        'getById',
        {'id': id},
      );

  _i2.Future<_i3.Category?> add(_i3.Category row) =>
      caller.callServerEndpoint<_i3.Category?>(
        'category',
        'add',
        {'row': row},
      );

  _i2.Future<_i3.Category?> update(_i3.Category row) =>
      caller.callServerEndpoint<_i3.Category?>(
        'category',
        'update',
        {'row': row},
      );

  _i2.Future<_i3.Category?> delete(_i3.Category row) =>
      caller.callServerEndpoint<_i3.Category?>(
        'category',
        'delete',
        {'row': row},
      );

  _i2.Future<List<_i4.Question?>> getQuestions(int category) =>
      caller.callServerEndpoint<List<_i4.Question?>>(
        'category',
        'getQuestions',
        {'category': category},
      );

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'category',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(
    String path,
    int catId,
  ) =>
      caller.callServerEndpoint<bool>(
        'category',
        'verifyUpload',
        {
          'path': path,
          'catId': catId,
        },
      );
}

/// {@category Endpoint}
class EndpointCompetition extends _i1.EndpointRef {
  EndpointCompetition(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'competition';

  _i2.Future<bool?> otherAnswerCheck(_i5.AnswerCheck message) =>
      caller.callServerEndpoint<bool?>(
        'competition',
        'otherAnswerCheck',
        {'message': message},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointOnline extends _i1.EndpointRef {
  EndpointOnline(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'online';

  _i2.Future<void> competition(
    _i6.OnlineUser message, {
    int? categoryId,
  }) =>
      caller.callServerEndpoint<void>(
        'online',
        'competition',
        {
          'message': message,
          'categoryId': categoryId,
        },
      );

  _i2.Future<_i6.OnlineUser?> addUser(_i6.OnlineUser row) =>
      caller.callServerEndpoint<_i6.OnlineUser?>(
        'online',
        'addUser',
        {'row': row},
      );
}

/// {@category Endpoint}
class EndpointQuestion extends _i1.EndpointRef {
  EndpointQuestion(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'question';

  _i2.Future<List<_i4.Question>?> getAll({
    int? categoryId,
    int? quizId,
    int? limit,
    int? offset,
    required bool admin,
    required bool competition,
    required bool categoryIds,
  }) =>
      caller.callServerEndpoint<List<_i4.Question>?>(
        'question',
        'getAll',
        {
          'categoryId': categoryId,
          'quizId': quizId,
          'limit': limit,
          'offset': offset,
          'admin': admin,
          'competition': competition,
          'categoryIds': categoryIds,
        },
      );

  _i2.Future<_i4.Question?> add(_i4.Question question) =>
      caller.callServerEndpoint<_i4.Question?>(
        'question',
        'add',
        {'question': question},
      );

  _i2.Future<_i4.Question?> update(_i4.Question question) =>
      caller.callServerEndpoint<_i4.Question?>(
        'question',
        'update',
        {'question': question},
      );

  _i2.Future<_i4.Question?> delete(_i4.Question question) =>
      caller.callServerEndpoint<_i4.Question?>(
        'question',
        'delete',
        {'question': question},
      );

  _i2.Future<_i4.Question?> getById(int id) =>
      caller.callServerEndpoint<_i4.Question?>(
        'question',
        'getById',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointQuiz extends _i1.EndpointRef {
  EndpointQuiz(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quiz';

  _i2.Future<_i7.Quiz?> add(_i7.Quiz data) =>
      caller.callServerEndpoint<_i7.Quiz?>(
        'quiz',
        'add',
        {'data': data},
      );

  _i2.Future<_i7.Quiz?> delete(_i7.Quiz data) =>
      caller.callServerEndpoint<_i7.Quiz?>(
        'quiz',
        'delete',
        {'data': data},
      );

  _i2.Future<List<_i7.Quiz>?> getAll({
    int? limit,
    int? offset,
  }) =>
      caller.callServerEndpoint<List<_i7.Quiz>?>(
        'quiz',
        'getAll',
        {
          'limit': limit,
          'offset': offset,
        },
      );

  _i2.Future<_i7.Quiz?> getById(int id) => caller.callServerEndpoint<_i7.Quiz?>(
        'quiz',
        'getById',
        {'id': id},
      );

  _i2.Future<_i7.Quiz?> update(_i7.Quiz data) =>
      caller.callServerEndpoint<_i7.Quiz?>(
        'quiz',
        'update',
        {'data': data},
      );
}

/// {@category Endpoint}
class EndpointQuizResult extends _i1.EndpointRef {
  EndpointQuizResult(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quizResult';

  _i2.Future<_i8.QuizResult?> add(_i8.QuizResult data) =>
      caller.callServerEndpoint<_i8.QuizResult?>(
        'quizResult',
        'add',
        {'data': data},
      );

  _i2.Future<List<_i8.QuizResult>?> getAll({
    int? limit,
    int? offset,
  }) =>
      caller.callServerEndpoint<List<_i8.QuizResult>?>(
        'quizResult',
        'getAll',
        {
          'limit': limit,
          'offset': offset,
        },
      );

  _i2.Future<List<_i9.User>?> leaderBoard() =>
      caller.callServerEndpoint<List<_i9.User>?>(
        'quizResult',
        'leaderBoard',
        {},
      );

  _i2.Future<_i10.AdminQuizResult?> adminResult(int? userId) =>
      caller.callServerEndpoint<_i10.AdminQuizResult?>(
        'quizResult',
        'adminResult',
        {'userId': userId},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<bool> userInfoUpdate(_i9.User user) =>
      caller.callServerEndpoint<bool>(
        'user',
        'userInfoUpdate',
        {'user': user},
      );

  _i2.Future<_i9.User?> add(_i9.User data) =>
      caller.callServerEndpoint<_i9.User?>(
        'user',
        'add',
        {'data': data},
      );

  _i2.Future<_i9.User?> delete(_i9.User data) =>
      caller.callServerEndpoint<_i9.User?>(
        'user',
        'delete',
        {'data': data},
      );

  _i2.Future<List<_i9.User>?> getAll({
    int? limit,
    int? offset,
  }) =>
      caller.callServerEndpoint<List<_i9.User>?>(
        'user',
        'getAll',
        {
          'limit': limit,
          'offset': offset,
        },
      );

  _i2.Future<_i9.User?> getById(int id) => caller.callServerEndpoint<_i9.User?>(
        'user',
        'getById',
        {'id': id},
      );

  _i2.Future<_i9.User?> getByUserInfoId(int id) =>
      caller.callServerEndpoint<_i9.User?>(
        'user',
        'getByUserInfoId',
        {'id': id},
      );

  _i2.Future<_i9.User?> update(_i9.User data) =>
      caller.callServerEndpoint<_i9.User?>(
        'user',
        'update',
        {'data': data},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i11.Caller(client);
  }

  late final _i11.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i12.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    category = EndpointCategory(this);
    competition = EndpointCompetition(this);
    example = EndpointExample(this);
    online = EndpointOnline(this);
    question = EndpointQuestion(this);
    quiz = EndpointQuiz(this);
    quizResult = EndpointQuizResult(this);
    user = EndpointUser(this);
    modules = _Modules(this);
  }

  late final EndpointCategory category;

  late final EndpointCompetition competition;

  late final EndpointExample example;

  late final EndpointOnline online;

  late final EndpointQuestion question;

  late final EndpointQuiz quiz;

  late final EndpointQuizResult quizResult;

  late final EndpointUser user;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'category': category,
        'competition': competition,
        'example': example,
        'online': online,
        'question': question,
        'quiz': quiz,
        'quizResult': quizResult,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
