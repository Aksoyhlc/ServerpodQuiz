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
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Quiz extends _i1.TableRow implements _i1.ProtocolSerialization {
  Quiz._({
    int? id,
    this.title,
    this.description,
    this.questions,
    this.questionsIds,
    this.time,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.type,
    this.user,
  }) : super(id);

  factory Quiz({
    int? id,
    String? title,
    String? description,
    List<_i2.QuizQuestion>? questions,
    List<String>? questionsIds,
    int? time,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.QuizStatus? status,
    _i2.QuizType? type,
    _i2.User? user,
  }) = _QuizImpl;

  factory Quiz.fromJson(Map<String, dynamic> jsonSerialization) {
    return Quiz(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String?,
      description: jsonSerialization['description'] as String?,
      questions: (jsonSerialization['questions'] as List?)
          ?.map((e) => _i2.QuizQuestion.fromJson((e as Map<String, dynamic>)))
          .toList(),
      questionsIds: (jsonSerialization['questionsIds'] as List?)
          ?.map((e) => e as String)
          .toList(),
      time: jsonSerialization['time'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      status: jsonSerialization['status'] == null
          ? null
          : _i2.QuizStatus.fromJson((jsonSerialization['status'] as String)),
      type: jsonSerialization['type'] == null
          ? null
          : _i2.QuizType.fromJson((jsonSerialization['type'] as String)),
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
    );
  }

  static final t = QuizTable();

  static const db = QuizRepository._();

  String? title;

  String? description;

  List<_i2.QuizQuestion>? questions;

  List<String>? questionsIds;

  int? time;

  DateTime? createdAt;

  DateTime? updatedAt;

  _i2.QuizStatus? status;

  _i2.QuizType? type;

  _i2.User? user;

  @override
  _i1.Table get table => t;

  Quiz copyWith({
    int? id,
    String? title,
    String? description,
    List<_i2.QuizQuestion>? questions,
    List<String>? questionsIds,
    int? time,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.QuizStatus? status,
    _i2.QuizType? type,
    _i2.User? user,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (questions != null)
        'questions': questions?.toJson(valueToJson: (v) => v.toJson()),
      if (questionsIds != null) 'questionsIds': questionsIds?.toJson(),
      if (time != null) 'time': time,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (status != null) 'status': status?.toJson(),
      if (type != null) 'type': type?.toJson(),
      if (user != null) 'user': user?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (questions != null)
        'questions':
            questions?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (questionsIds != null) 'questionsIds': questionsIds?.toJson(),
      if (time != null) 'time': time,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (status != null) 'status': status?.toJson(),
      if (type != null) 'type': type?.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
    };
  }

  static QuizInclude include({_i2.QuizQuestionIncludeList? questions}) {
    return QuizInclude._(questions: questions);
  }

  static QuizIncludeList includeList({
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizTable>? orderByList,
    QuizInclude? include,
  }) {
    return QuizIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Quiz.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Quiz.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizImpl extends Quiz {
  _QuizImpl({
    int? id,
    String? title,
    String? description,
    List<_i2.QuizQuestion>? questions,
    List<String>? questionsIds,
    int? time,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.QuizStatus? status,
    _i2.QuizType? type,
    _i2.User? user,
  }) : super._(
          id: id,
          title: title,
          description: description,
          questions: questions,
          questionsIds: questionsIds,
          time: time,
          createdAt: createdAt,
          updatedAt: updatedAt,
          status: status,
          type: type,
          user: user,
        );

  @override
  Quiz copyWith({
    Object? id = _Undefined,
    Object? title = _Undefined,
    Object? description = _Undefined,
    Object? questions = _Undefined,
    Object? questionsIds = _Undefined,
    Object? time = _Undefined,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
    Object? status = _Undefined,
    Object? type = _Undefined,
    Object? user = _Undefined,
  }) {
    return Quiz(
      id: id is int? ? id : this.id,
      title: title is String? ? title : this.title,
      description: description is String? ? description : this.description,
      questions: questions is List<_i2.QuizQuestion>?
          ? questions
          : this.questions?.clone(),
      questionsIds: questionsIds is List<String>?
          ? questionsIds
          : this.questionsIds?.clone(),
      time: time is int? ? time : this.time,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      status: status is _i2.QuizStatus? ? status : this.status,
      type: type is _i2.QuizType? ? type : this.type,
      user: user is _i2.User? ? user : this.user?.copyWith(),
    );
  }
}

class QuizTable extends _i1.Table {
  QuizTable({super.tableRelation}) : super(tableName: 'quiz') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    time = _i1.ColumnInt(
      'time',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    user = _i1.ColumnSerializable(
      'user',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  _i2.QuizQuestionTable? ___questions;

  _i1.ManyRelation<_i2.QuizQuestionTable>? _questions;

  late final _i1.ColumnInt time;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnEnum<_i2.QuizStatus> status;

  late final _i1.ColumnEnum<_i2.QuizType> type;

  late final _i1.ColumnSerializable user;

  _i2.QuizQuestionTable get __questions {
    if (___questions != null) return ___questions!;
    ___questions = _i1.createRelationTable(
      relationFieldName: '__questions',
      field: Quiz.t.id,
      foreignField: _i2.QuizQuestion.t.quizId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuizQuestionTable(tableRelation: foreignTableRelation),
    );
    return ___questions!;
  }

  _i1.ManyRelation<_i2.QuizQuestionTable> get questions {
    if (_questions != null) return _questions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'questions',
      field: Quiz.t.id,
      foreignField: _i2.QuizQuestion.t.quizId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuizQuestionTable(tableRelation: foreignTableRelation),
    );
    _questions = _i1.ManyRelation<_i2.QuizQuestionTable>(
      tableWithRelations: relationTable,
      table: _i2.QuizQuestionTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _questions!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        description,
        time,
        createdAt,
        updatedAt,
        status,
        type,
        user,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'questions') {
      return __questions;
    }
    return null;
  }
}

class QuizInclude extends _i1.IncludeObject {
  QuizInclude._({_i2.QuizQuestionIncludeList? questions}) {
    _questions = questions;
  }

  _i2.QuizQuestionIncludeList? _questions;

  @override
  Map<String, _i1.Include?> get includes => {'questions': _questions};

  @override
  _i1.Table get table => Quiz.t;
}

class QuizIncludeList extends _i1.IncludeList {
  QuizIncludeList._({
    _i1.WhereExpressionBuilder<QuizTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Quiz.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Quiz.t;
}

class QuizRepository {
  const QuizRepository._();

  final attach = const QuizAttachRepository._();

  final attachRow = const QuizAttachRowRepository._();

  Future<List<Quiz>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizTable>? orderByList,
    _i1.Transaction? transaction,
    QuizInclude? include,
  }) async {
    return session.db.find<Quiz>(
      where: where?.call(Quiz.t),
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Quiz?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuizTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizTable>? orderByList,
    _i1.Transaction? transaction,
    QuizInclude? include,
  }) async {
    return session.db.findFirstRow<Quiz>(
      where: where?.call(Quiz.t),
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Quiz?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    QuizInclude? include,
  }) async {
    return session.db.findById<Quiz>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Quiz>> insert(
    _i1.Session session,
    List<Quiz> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Quiz>(
      rows,
      transaction: transaction,
    );
  }

  Future<Quiz> insertRow(
    _i1.Session session,
    Quiz row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Quiz>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Quiz>> update(
    _i1.Session session,
    List<Quiz> rows, {
    _i1.ColumnSelections<QuizTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Quiz>(
      rows,
      columns: columns?.call(Quiz.t),
      transaction: transaction,
    );
  }

  Future<Quiz> updateRow(
    _i1.Session session,
    Quiz row, {
    _i1.ColumnSelections<QuizTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Quiz>(
      row,
      columns: columns?.call(Quiz.t),
      transaction: transaction,
    );
  }

  Future<List<Quiz>> delete(
    _i1.Session session,
    List<Quiz> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Quiz>(
      rows,
      transaction: transaction,
    );
  }

  Future<Quiz> deleteRow(
    _i1.Session session,
    Quiz row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Quiz>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Quiz>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuizTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Quiz>(
      where: where(Quiz.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Quiz>(
      where: where?.call(Quiz.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class QuizAttachRepository {
  const QuizAttachRepository._();

  Future<void> questions(
    _i1.Session session,
    Quiz quiz,
    List<_i2.QuizQuestion> quizQuestion,
  ) async {
    if (quizQuestion.any((e) => e.id == null)) {
      throw ArgumentError.notNull('quizQuestion.id');
    }
    if (quiz.id == null) {
      throw ArgumentError.notNull('quiz.id');
    }

    var $quizQuestion =
        quizQuestion.map((e) => e.copyWith(quizId: quiz.id)).toList();
    await session.db.update<_i2.QuizQuestion>(
      $quizQuestion,
      columns: [_i2.QuizQuestion.t.quizId],
    );
  }
}

class QuizAttachRowRepository {
  const QuizAttachRowRepository._();

  Future<void> questions(
    _i1.Session session,
    Quiz quiz,
    _i2.QuizQuestion quizQuestion,
  ) async {
    if (quizQuestion.id == null) {
      throw ArgumentError.notNull('quizQuestion.id');
    }
    if (quiz.id == null) {
      throw ArgumentError.notNull('quiz.id');
    }

    var $quizQuestion = quizQuestion.copyWith(quizId: quiz.id);
    await session.db.updateRow<_i2.QuizQuestion>(
      $quizQuestion,
      columns: [_i2.QuizQuestion.t.quizId],
    );
  }
}
