/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/category_endpoint.dart' as _i2;
import '../endpoints/competition_endpoint.dart' as _i3;
import '../endpoints/example_endpoint.dart' as _i4;
import '../endpoints/online_endpoint.dart' as _i5;
import '../endpoints/question_endpoint.dart' as _i6;
import '../endpoints/quiz_endpoint.dart' as _i7;
import '../endpoints/quiz_result_endpoint.dart' as _i8;
import '../endpoints/user_endpoint.dart' as _i9;
import 'package:quizvideo_server/src/generated/category/category.dart' as _i10;
import 'package:quizvideo_server/src/generated/competition/answer_check.dart'
    as _i11;
import 'package:quizvideo_server/src/generated/online_user.dart' as _i12;
import 'package:quizvideo_server/src/generated/question/question.dart' as _i13;
import 'package:quizvideo_server/src/generated/quiz/quiz.dart' as _i14;
import 'package:quizvideo_server/src/generated/quizResult/quiz_result.dart'
    as _i15;
import 'package:quizvideo_server/src/generated/user.dart' as _i16;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i17;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'category': _i2.CategoryEndpoint()
        ..initialize(
          server,
          'category',
          null,
        ),
      'competition': _i3.CompetitionEndpoint()
        ..initialize(
          server,
          'competition',
          null,
        ),
      'example': _i4.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'online': _i5.OnlineEndpoint()
        ..initialize(
          server,
          'online',
          null,
        ),
      'question': _i6.QuestionEndpoint()
        ..initialize(
          server,
          'question',
          null,
        ),
      'quiz': _i7.QuizEndpoint()
        ..initialize(
          server,
          'quiz',
          null,
        ),
      'quizResult': _i8.QuizResultEndpoint()
        ..initialize(
          server,
          'quizResult',
          null,
        ),
      'user': _i9.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['category'] = _i1.EndpointConnector(
      name: 'category',
      endpoint: endpoints['category']!,
      methodConnectors: {
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).getAll(
            session,
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).getById(
            session,
            params['id'],
          ),
        ),
        'add': _i1.MethodConnector(
          name: 'add',
          params: {
            'row': _i1.ParameterDescription(
              name: 'row',
              type: _i1.getType<_i10.Category>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).add(
            session,
            params['row'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'row': _i1.ParameterDescription(
              name: 'row',
              type: _i1.getType<_i10.Category>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).update(
            session,
            params['row'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'row': _i1.ParameterDescription(
              name: 'row',
              type: _i1.getType<_i10.Category>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).delete(
            session,
            params['row'],
          ),
        ),
        'getQuestions': _i1.MethodConnector(
          name: 'getQuestions',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).getQuestions(
            session,
            params['category'],
          ),
        ),
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint)
                  .getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'catId': _i1.ParameterDescription(
              name: 'catId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).verifyUpload(
            session,
            params['path'],
            params['catId'],
          ),
        ),
      },
    );
    connectors['competition'] = _i1.EndpointConnector(
      name: 'competition',
      endpoint: endpoints['competition']!,
      methodConnectors: {
        'otherAnswerCheck': _i1.MethodConnector(
          name: 'otherAnswerCheck',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i11.AnswerCheck>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['competition'] as _i3.CompetitionEndpoint)
                  .otherAnswerCheck(
            session,
            params['message'],
          ),
        )
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i4.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['online'] = _i1.EndpointConnector(
      name: 'online',
      endpoint: endpoints['online']!,
      methodConnectors: {
        'competition': _i1.MethodConnector(
          name: 'competition',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i12.OnlineUser>(),
              nullable: false,
            ),
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['online'] as _i5.OnlineEndpoint).competition(
            session,
            params['message'],
            categoryId: params['categoryId'],
          ),
        ),
        'addUser': _i1.MethodConnector(
          name: 'addUser',
          params: {
            'row': _i1.ParameterDescription(
              name: 'row',
              type: _i1.getType<_i12.OnlineUser>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['online'] as _i5.OnlineEndpoint).addUser(
            session,
            params['row'],
          ),
        ),
      },
    );
    connectors['question'] = _i1.EndpointConnector(
      name: 'question',
      endpoint: endpoints['question']!,
      methodConnectors: {
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'quizId': _i1.ParameterDescription(
              name: 'quizId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'admin': _i1.ParameterDescription(
              name: 'admin',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'competition': _i1.ParameterDescription(
              name: 'competition',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'categoryIds': _i1.ParameterDescription(
              name: 'categoryIds',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i6.QuestionEndpoint).getAll(
            session,
            categoryId: params['categoryId'],
            quizId: params['quizId'],
            limit: params['limit'],
            offset: params['offset'],
            admin: params['admin'],
            competition: params['competition'],
            categoryIds: params['categoryIds'],
          ),
        ),
        'add': _i1.MethodConnector(
          name: 'add',
          params: {
            'question': _i1.ParameterDescription(
              name: 'question',
              type: _i1.getType<_i13.Question>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i6.QuestionEndpoint).add(
            session,
            params['question'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'question': _i1.ParameterDescription(
              name: 'question',
              type: _i1.getType<_i13.Question>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i6.QuestionEndpoint).update(
            session,
            params['question'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'question': _i1.ParameterDescription(
              name: 'question',
              type: _i1.getType<_i13.Question>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i6.QuestionEndpoint).delete(
            session,
            params['question'],
          ),
        ),
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i6.QuestionEndpoint).getById(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['quiz'] = _i1.EndpointConnector(
      name: 'quiz',
      endpoint: endpoints['quiz']!,
      methodConnectors: {
        'add': _i1.MethodConnector(
          name: 'add',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i14.Quiz>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i7.QuizEndpoint).add(
            session,
            params['data'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i14.Quiz>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i7.QuizEndpoint).delete(
            session,
            params['data'],
          ),
        ),
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i7.QuizEndpoint).getAll(
            session,
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i7.QuizEndpoint).getById(
            session,
            params['id'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i14.Quiz>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quiz'] as _i7.QuizEndpoint).update(
            session,
            params['data'],
          ),
        ),
      },
    );
    connectors['quizResult'] = _i1.EndpointConnector(
      name: 'quizResult',
      endpoint: endpoints['quizResult']!,
      methodConnectors: {
        'add': _i1.MethodConnector(
          name: 'add',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i15.QuizResult>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quizResult'] as _i8.QuizResultEndpoint).add(
            session,
            params['data'],
          ),
        ),
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quizResult'] as _i8.QuizResultEndpoint).getAll(
            session,
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'leaderBoard': _i1.MethodConnector(
          name: 'leaderBoard',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quizResult'] as _i8.QuizResultEndpoint)
                  .leaderBoard(session),
        ),
        'adminResult': _i1.MethodConnector(
          name: 'adminResult',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['quizResult'] as _i8.QuizResultEndpoint).adminResult(
            session,
            params['userId'],
          ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'userInfoUpdate': _i1.MethodConnector(
          name: 'userInfoUpdate',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i16.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i9.UserEndpoint).userInfoUpdate(
            session,
            params['user'],
          ),
        ),
        'add': _i1.MethodConnector(
          name: 'add',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i16.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i9.UserEndpoint).add(
            session,
            params['data'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i16.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i9.UserEndpoint).delete(
            session,
            params['data'],
          ),
        ),
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i9.UserEndpoint).getAll(
            session,
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i9.UserEndpoint).getById(
            session,
            params['id'],
          ),
        ),
        'getByUserInfoId': _i1.MethodConnector(
          name: 'getByUserInfoId',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i9.UserEndpoint).getByUserInfoId(
            session,
            params['id'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i16.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i9.UserEndpoint).update(
            session,
            params['data'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i17.Endpoints()..initializeEndpoints(server);
  }
}
