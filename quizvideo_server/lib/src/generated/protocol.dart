/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'category/category.dart' as _i4;
import 'category/category_question.dart' as _i5;
import 'competition/answer_check.dart' as _i6;
import 'competition/competition.dart' as _i7;
import 'competition/competition_answer_model.dart' as _i8;
import 'db_exception.dart' as _i9;
import 'db_exception_status.dart' as _i10;
import 'example.dart' as _i11;
import 'online_user.dart' as _i12;
import 'question/question.dart' as _i13;
import 'question/quiz_question.dart' as _i14;
import 'quiz/quiz.dart' as _i15;
import 'quiz/quiz_status.dart' as _i16;
import 'quiz/quiz_type.dart' as _i17;
import 'quizResult/admin_quiz_result.dart' as _i18;
import 'quizResult/quiz_result.dart' as _i19;
import 'quizResult/quiz_result_type.dart' as _i20;
import 'stream_action.dart' as _i21;
import 'user.dart' as _i22;
import 'protocol.dart' as _i23;
import 'package:quizvideo_server/src/generated/category/category.dart' as _i24;
import 'package:quizvideo_server/src/generated/question/question.dart' as _i25;
import 'package:quizvideo_server/src/generated/quiz/quiz.dart' as _i26;
import 'package:quizvideo_server/src/generated/quizResult/quiz_result.dart'
    as _i27;
import 'package:quizvideo_server/src/generated/user.dart' as _i28;
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

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'category',
      dartName: 'Category',
      schema: 'public',
      module: 'quizvideo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'category_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'image',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'category_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'category_question',
      dartName: 'CategoryQuestion',
      schema: 'public',
      module: 'quizvideo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'category_question_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'categoryId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'questionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'category_question_fk_0',
          columns: ['categoryId'],
          referenceTable: 'category',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.cascade,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'category_question_fk_1',
          columns: ['questionId'],
          referenceTable: 'question',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.cascade,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'category_question_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'category_questions_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'categoryId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'questionId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'competition',
      dartName: 'Competition',
      schema: 'public',
      module: 'quizvideo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'competition_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'identifier',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'user1Id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'user2Id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:QuizResultType',
        ),
        _i2.ColumnDefinition(
          name: 'typeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'competition_fk_0',
          columns: ['user1Id'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'competition_fk_1',
          columns: ['user2Id'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'competition_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'competition_identifier_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'identifier',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'online_user',
      dartName: 'OnlineUser',
      schema: 'public',
      module: 'quizvideo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'online_user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:QuizResultType',
        ),
        _i2.ColumnDefinition(
          name: 'typeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'online_user_fk_0',
          columns: ['userId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.cascade,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'online_user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'question',
      dartName: 'Question',
      schema: 'public',
      module: 'quizvideo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'question_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'a',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'b',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'c',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'd',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'answer',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'point',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'question_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'quiz',
      dartName: 'Quiz',
      schema: 'public',
      module: 'quizvideo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'quiz_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'time',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'protocol:QuizStatus?',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'protocol:QuizType?',
        ),
        _i2.ColumnDefinition(
          name: 'user',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'protocol:User?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'quiz_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'quiz_status_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'status',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'quiz_question',
      dartName: 'QuizQuestion',
      schema: 'public',
      module: 'quizvideo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'quiz_question_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'quizId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'questionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'quiz_question_fk_0',
          columns: ['quizId'],
          referenceTable: 'quiz',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.cascade,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'quiz_question_fk_1',
          columns: ['questionId'],
          referenceTable: 'question',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.cascade,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'quiz_question_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'quiz_result',
      dartName: 'QuizResult',
      schema: 'public',
      module: 'quizvideo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'quiz_result_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'typeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:QuizResultType',
        ),
        _i2.ColumnDefinition(
          name: 'correctCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'wrongCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'passedCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'point',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'startedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'endAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'quiz_result_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user',
      dartName: 'User',
      schema: 'public',
      module: 'quizvideo',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.cascade,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.Category) {
      return _i4.Category.fromJson(data) as T;
    }
    if (t == _i5.CategoryQuestion) {
      return _i5.CategoryQuestion.fromJson(data) as T;
    }
    if (t == _i6.AnswerCheck) {
      return _i6.AnswerCheck.fromJson(data) as T;
    }
    if (t == _i7.Competition) {
      return _i7.Competition.fromJson(data) as T;
    }
    if (t == _i8.CompetitionAnswer) {
      return _i8.CompetitionAnswer.fromJson(data) as T;
    }
    if (t == _i9.DbException) {
      return _i9.DbException.fromJson(data) as T;
    }
    if (t == _i10.ExType) {
      return _i10.ExType.fromJson(data) as T;
    }
    if (t == _i11.Example) {
      return _i11.Example.fromJson(data) as T;
    }
    if (t == _i12.OnlineUser) {
      return _i12.OnlineUser.fromJson(data) as T;
    }
    if (t == _i13.Question) {
      return _i13.Question.fromJson(data) as T;
    }
    if (t == _i14.QuizQuestion) {
      return _i14.QuizQuestion.fromJson(data) as T;
    }
    if (t == _i15.Quiz) {
      return _i15.Quiz.fromJson(data) as T;
    }
    if (t == _i16.QuizStatus) {
      return _i16.QuizStatus.fromJson(data) as T;
    }
    if (t == _i17.QuizType) {
      return _i17.QuizType.fromJson(data) as T;
    }
    if (t == _i18.AdminQuizResult) {
      return _i18.AdminQuizResult.fromJson(data) as T;
    }
    if (t == _i19.QuizResult) {
      return _i19.QuizResult.fromJson(data) as T;
    }
    if (t == _i20.QuizResultType) {
      return _i20.QuizResultType.fromJson(data) as T;
    }
    if (t == _i21.StreamAction) {
      return _i21.StreamAction.fromJson(data) as T;
    }
    if (t == _i22.User) {
      return _i22.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Category?>()) {
      return (data != null ? _i4.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.CategoryQuestion?>()) {
      return (data != null ? _i5.CategoryQuestion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AnswerCheck?>()) {
      return (data != null ? _i6.AnswerCheck.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Competition?>()) {
      return (data != null ? _i7.Competition.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CompetitionAnswer?>()) {
      return (data != null ? _i8.CompetitionAnswer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.DbException?>()) {
      return (data != null ? _i9.DbException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ExType?>()) {
      return (data != null ? _i10.ExType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Example?>()) {
      return (data != null ? _i11.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.OnlineUser?>()) {
      return (data != null ? _i12.OnlineUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Question?>()) {
      return (data != null ? _i13.Question.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.QuizQuestion?>()) {
      return (data != null ? _i14.QuizQuestion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Quiz?>()) {
      return (data != null ? _i15.Quiz.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.QuizStatus?>()) {
      return (data != null ? _i16.QuizStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.QuizType?>()) {
      return (data != null ? _i17.QuizType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.AdminQuizResult?>()) {
      return (data != null ? _i18.AdminQuizResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.QuizResult?>()) {
      return (data != null ? _i19.QuizResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.QuizResultType?>()) {
      return (data != null ? _i20.QuizResultType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.StreamAction?>()) {
      return (data != null ? _i21.StreamAction.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.User?>()) {
      return (data != null ? _i22.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<int?>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int?>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.CategoryQuestion>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.CategoryQuestion>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.Question>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i23.Question>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.CategoryQuestion>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.CategoryQuestion>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.QuizQuestion>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.QuizQuestion>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i23.QuizQuestion>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i23.QuizQuestion>(e))
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
    if (t == _i1.getType<List<_i24.Category>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i24.Category>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i25.Question?>) {
      return (data as List).map((e) => deserialize<_i25.Question?>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i25.Question>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i25.Question>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i26.Quiz>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i26.Quiz>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i27.QuizResult>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i27.QuizResult>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i28.User>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i28.User>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i28.User>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i28.User>(e)).toList()
          : null) as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i4.Category) {
      return 'Category';
    }
    if (data is _i5.CategoryQuestion) {
      return 'CategoryQuestion';
    }
    if (data is _i6.AnswerCheck) {
      return 'AnswerCheck';
    }
    if (data is _i7.Competition) {
      return 'Competition';
    }
    if (data is _i8.CompetitionAnswer) {
      return 'CompetitionAnswer';
    }
    if (data is _i9.DbException) {
      return 'DbException';
    }
    if (data is _i10.ExType) {
      return 'ExType';
    }
    if (data is _i11.Example) {
      return 'Example';
    }
    if (data is _i12.OnlineUser) {
      return 'OnlineUser';
    }
    if (data is _i13.Question) {
      return 'Question';
    }
    if (data is _i14.QuizQuestion) {
      return 'QuizQuestion';
    }
    if (data is _i15.Quiz) {
      return 'Quiz';
    }
    if (data is _i16.QuizStatus) {
      return 'QuizStatus';
    }
    if (data is _i17.QuizType) {
      return 'QuizType';
    }
    if (data is _i18.AdminQuizResult) {
      return 'AdminQuizResult';
    }
    if (data is _i19.QuizResult) {
      return 'QuizResult';
    }
    if (data is _i20.QuizResultType) {
      return 'QuizResultType';
    }
    if (data is _i21.StreamAction) {
      return 'StreamAction';
    }
    if (data is _i22.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Category') {
      return deserialize<_i4.Category>(data['data']);
    }
    if (data['className'] == 'CategoryQuestion') {
      return deserialize<_i5.CategoryQuestion>(data['data']);
    }
    if (data['className'] == 'AnswerCheck') {
      return deserialize<_i6.AnswerCheck>(data['data']);
    }
    if (data['className'] == 'Competition') {
      return deserialize<_i7.Competition>(data['data']);
    }
    if (data['className'] == 'CompetitionAnswer') {
      return deserialize<_i8.CompetitionAnswer>(data['data']);
    }
    if (data['className'] == 'DbException') {
      return deserialize<_i9.DbException>(data['data']);
    }
    if (data['className'] == 'ExType') {
      return deserialize<_i10.ExType>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i11.Example>(data['data']);
    }
    if (data['className'] == 'OnlineUser') {
      return deserialize<_i12.OnlineUser>(data['data']);
    }
    if (data['className'] == 'Question') {
      return deserialize<_i13.Question>(data['data']);
    }
    if (data['className'] == 'QuizQuestion') {
      return deserialize<_i14.QuizQuestion>(data['data']);
    }
    if (data['className'] == 'Quiz') {
      return deserialize<_i15.Quiz>(data['data']);
    }
    if (data['className'] == 'QuizStatus') {
      return deserialize<_i16.QuizStatus>(data['data']);
    }
    if (data['className'] == 'QuizType') {
      return deserialize<_i17.QuizType>(data['data']);
    }
    if (data['className'] == 'AdminQuizResult') {
      return deserialize<_i18.AdminQuizResult>(data['data']);
    }
    if (data['className'] == 'QuizResult') {
      return deserialize<_i19.QuizResult>(data['data']);
    }
    if (data['className'] == 'QuizResultType') {
      return deserialize<_i20.QuizResultType>(data['data']);
    }
    if (data['className'] == 'StreamAction') {
      return deserialize<_i21.StreamAction>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i22.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Category:
        return _i4.Category.t;
      case _i5.CategoryQuestion:
        return _i5.CategoryQuestion.t;
      case _i7.Competition:
        return _i7.Competition.t;
      case _i12.OnlineUser:
        return _i12.OnlineUser.t;
      case _i13.Question:
        return _i13.Question.t;
      case _i14.QuizQuestion:
        return _i14.QuizQuestion.t;
      case _i15.Quiz:
        return _i15.Quiz.t;
      case _i19.QuizResult:
        return _i19.QuizResult.t;
      case _i22.User:
        return _i22.User.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'quizvideo';
}
