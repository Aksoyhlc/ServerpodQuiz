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

abstract class QuizQuestion extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  QuizQuestion._({
    int? id,
    required this.quizId,
    this.quiz,
    required this.questionId,
    this.question,
    required this.createdAt,
  }) : super(id);

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

  static final t = QuizQuestionTable();

  static const db = QuizQuestionRepository._();

  int quizId;

  _i2.Quiz? quiz;

  int questionId;

  _i2.Question? question;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'quizId': quizId,
      if (quiz != null) 'quiz': quiz?.toJsonForProtocol(),
      'questionId': questionId,
      if (question != null) 'question': question?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
    };
  }

  static QuizQuestionInclude include({
    _i2.QuizInclude? quiz,
    _i2.QuestionInclude? question,
  }) {
    return QuizQuestionInclude._(
      quiz: quiz,
      question: question,
    );
  }

  static QuizQuestionIncludeList includeList({
    _i1.WhereExpressionBuilder<QuizQuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizQuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizQuestionTable>? orderByList,
    QuizQuestionInclude? include,
  }) {
    return QuizQuestionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(QuizQuestion.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(QuizQuestion.t),
      include: include,
    );
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

class QuizQuestionTable extends _i1.Table {
  QuizQuestionTable({super.tableRelation}) : super(tableName: 'quiz_question') {
    quizId = _i1.ColumnInt(
      'quizId',
      this,
    );
    questionId = _i1.ColumnInt(
      'questionId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnInt quizId;

  _i2.QuizTable? _quiz;

  late final _i1.ColumnInt questionId;

  _i2.QuestionTable? _question;

  late final _i1.ColumnDateTime createdAt;

  _i2.QuizTable get quiz {
    if (_quiz != null) return _quiz!;
    _quiz = _i1.createRelationTable(
      relationFieldName: 'quiz',
      field: QuizQuestion.t.quizId,
      foreignField: _i2.Quiz.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuizTable(tableRelation: foreignTableRelation),
    );
    return _quiz!;
  }

  _i2.QuestionTable get question {
    if (_question != null) return _question!;
    _question = _i1.createRelationTable(
      relationFieldName: 'question',
      field: QuizQuestion.t.questionId,
      foreignField: _i2.Question.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuestionTable(tableRelation: foreignTableRelation),
    );
    return _question!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        quizId,
        questionId,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'quiz') {
      return quiz;
    }
    if (relationField == 'question') {
      return question;
    }
    return null;
  }
}

class QuizQuestionInclude extends _i1.IncludeObject {
  QuizQuestionInclude._({
    _i2.QuizInclude? quiz,
    _i2.QuestionInclude? question,
  }) {
    _quiz = quiz;
    _question = question;
  }

  _i2.QuizInclude? _quiz;

  _i2.QuestionInclude? _question;

  @override
  Map<String, _i1.Include?> get includes => {
        'quiz': _quiz,
        'question': _question,
      };

  @override
  _i1.Table get table => QuizQuestion.t;
}

class QuizQuestionIncludeList extends _i1.IncludeList {
  QuizQuestionIncludeList._({
    _i1.WhereExpressionBuilder<QuizQuestionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(QuizQuestion.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => QuizQuestion.t;
}

class QuizQuestionRepository {
  const QuizQuestionRepository._();

  final attachRow = const QuizQuestionAttachRowRepository._();

  Future<List<QuizQuestion>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizQuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizQuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizQuestionTable>? orderByList,
    _i1.Transaction? transaction,
    QuizQuestionInclude? include,
  }) async {
    return session.db.find<QuizQuestion>(
      where: where?.call(QuizQuestion.t),
      orderBy: orderBy?.call(QuizQuestion.t),
      orderByList: orderByList?.call(QuizQuestion.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<QuizQuestion?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizQuestionTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuizQuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizQuestionTable>? orderByList,
    _i1.Transaction? transaction,
    QuizQuestionInclude? include,
  }) async {
    return session.db.findFirstRow<QuizQuestion>(
      where: where?.call(QuizQuestion.t),
      orderBy: orderBy?.call(QuizQuestion.t),
      orderByList: orderByList?.call(QuizQuestion.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<QuizQuestion?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    QuizQuestionInclude? include,
  }) async {
    return session.db.findById<QuizQuestion>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<QuizQuestion>> insert(
    _i1.Session session,
    List<QuizQuestion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<QuizQuestion>(
      rows,
      transaction: transaction,
    );
  }

  Future<QuizQuestion> insertRow(
    _i1.Session session,
    QuizQuestion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<QuizQuestion>(
      row,
      transaction: transaction,
    );
  }

  Future<List<QuizQuestion>> update(
    _i1.Session session,
    List<QuizQuestion> rows, {
    _i1.ColumnSelections<QuizQuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<QuizQuestion>(
      rows,
      columns: columns?.call(QuizQuestion.t),
      transaction: transaction,
    );
  }

  Future<QuizQuestion> updateRow(
    _i1.Session session,
    QuizQuestion row, {
    _i1.ColumnSelections<QuizQuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<QuizQuestion>(
      row,
      columns: columns?.call(QuizQuestion.t),
      transaction: transaction,
    );
  }

  Future<List<QuizQuestion>> delete(
    _i1.Session session,
    List<QuizQuestion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<QuizQuestion>(
      rows,
      transaction: transaction,
    );
  }

  Future<QuizQuestion> deleteRow(
    _i1.Session session,
    QuizQuestion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<QuizQuestion>(
      row,
      transaction: transaction,
    );
  }

  Future<List<QuizQuestion>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuizQuestionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<QuizQuestion>(
      where: where(QuizQuestion.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizQuestionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<QuizQuestion>(
      where: where?.call(QuizQuestion.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class QuizQuestionAttachRowRepository {
  const QuizQuestionAttachRowRepository._();

  Future<void> quiz(
    _i1.Session session,
    QuizQuestion quizQuestion,
    _i2.Quiz quiz,
  ) async {
    if (quizQuestion.id == null) {
      throw ArgumentError.notNull('quizQuestion.id');
    }
    if (quiz.id == null) {
      throw ArgumentError.notNull('quiz.id');
    }

    var $quizQuestion = quizQuestion.copyWith(quizId: quiz.id);
    await session.db.updateRow<QuizQuestion>(
      $quizQuestion,
      columns: [QuizQuestion.t.quizId],
    );
  }

  Future<void> question(
    _i1.Session session,
    QuizQuestion quizQuestion,
    _i2.Question question,
  ) async {
    if (quizQuestion.id == null) {
      throw ArgumentError.notNull('quizQuestion.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $quizQuestion = quizQuestion.copyWith(questionId: question.id);
    await session.db.updateRow<QuizQuestion>(
      $quizQuestion,
      columns: [QuizQuestion.t.questionId],
    );
  }
}
