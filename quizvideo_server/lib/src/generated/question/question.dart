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

abstract class Question extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Question._({
    int? id,
    required this.content,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.answer,
    required this.point,
    this.createdAt,
    this.updatedAt,
    this.categoryIds,
    this.categories,
    this.quizs,
  }) : super(id);

  factory Question({
    int? id,
    required String content,
    required String a,
    required String b,
    required String c,
    required String d,
    required String answer,
    required int point,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? categoryIds,
    List<_i2.CategoryQuestion>? categories,
    List<_i2.QuizQuestion>? quizs,
  }) = _QuestionImpl;

  factory Question.fromJson(Map<String, dynamic> jsonSerialization) {
    return Question(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      a: jsonSerialization['a'] as String,
      b: jsonSerialization['b'] as String,
      c: jsonSerialization['c'] as String,
      d: jsonSerialization['d'] as String,
      answer: jsonSerialization['answer'] as String,
      point: jsonSerialization['point'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      categoryIds: (jsonSerialization['categoryIds'] as List?)
          ?.map((e) => e as String)
          .toList(),
      categories: (jsonSerialization['categories'] as List?)
          ?.map(
              (e) => _i2.CategoryQuestion.fromJson((e as Map<String, dynamic>)))
          .toList(),
      quizs: (jsonSerialization['quizs'] as List?)
          ?.map((e) => _i2.QuizQuestion.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = QuestionTable();

  static const db = QuestionRepository._();

  String content;

  String a;

  String b;

  String c;

  String d;

  String answer;

  int point;

  DateTime? createdAt;

  DateTime? updatedAt;

  List<String>? categoryIds;

  List<_i2.CategoryQuestion>? categories;

  List<_i2.QuizQuestion>? quizs;

  @override
  _i1.Table get table => t;

  Question copyWith({
    int? id,
    String? content,
    String? a,
    String? b,
    String? c,
    String? d,
    String? answer,
    int? point,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? categoryIds,
    List<_i2.CategoryQuestion>? categories,
    List<_i2.QuizQuestion>? quizs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'a': a,
      'b': b,
      'c': c,
      'd': d,
      'answer': answer,
      'point': point,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (categoryIds != null) 'categoryIds': categoryIds?.toJson(),
      if (categories != null)
        'categories': categories?.toJson(valueToJson: (v) => v.toJson()),
      if (quizs != null) 'quizs': quizs?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'a': a,
      'b': b,
      'c': c,
      'd': d,
      'answer': answer,
      'point': point,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (categoryIds != null) 'categoryIds': categoryIds?.toJson(),
      if (categories != null)
        'categories':
            categories?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (quizs != null)
        'quizs': quizs?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static QuestionInclude include({
    _i2.CategoryQuestionIncludeList? categories,
    _i2.QuizQuestionIncludeList? quizs,
  }) {
    return QuestionInclude._(
      categories: categories,
      quizs: quizs,
    );
  }

  static QuestionIncludeList includeList({
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    QuestionInclude? include,
  }) {
    return QuestionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Question.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Question.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuestionImpl extends Question {
  _QuestionImpl({
    int? id,
    required String content,
    required String a,
    required String b,
    required String c,
    required String d,
    required String answer,
    required int point,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? categoryIds,
    List<_i2.CategoryQuestion>? categories,
    List<_i2.QuizQuestion>? quizs,
  }) : super._(
          id: id,
          content: content,
          a: a,
          b: b,
          c: c,
          d: d,
          answer: answer,
          point: point,
          createdAt: createdAt,
          updatedAt: updatedAt,
          categoryIds: categoryIds,
          categories: categories,
          quizs: quizs,
        );

  @override
  Question copyWith({
    Object? id = _Undefined,
    String? content,
    String? a,
    String? b,
    String? c,
    String? d,
    String? answer,
    int? point,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
    Object? categoryIds = _Undefined,
    Object? categories = _Undefined,
    Object? quizs = _Undefined,
  }) {
    return Question(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      a: a ?? this.a,
      b: b ?? this.b,
      c: c ?? this.c,
      d: d ?? this.d,
      answer: answer ?? this.answer,
      point: point ?? this.point,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      categoryIds: categoryIds is List<String>?
          ? categoryIds
          : this.categoryIds?.clone(),
      categories: categories is List<_i2.CategoryQuestion>?
          ? categories
          : this.categories?.clone(),
      quizs: quizs is List<_i2.QuizQuestion>? ? quizs : this.quizs?.clone(),
    );
  }
}

class QuestionTable extends _i1.Table {
  QuestionTable({super.tableRelation}) : super(tableName: 'question') {
    content = _i1.ColumnString(
      'content',
      this,
    );
    a = _i1.ColumnString(
      'a',
      this,
    );
    b = _i1.ColumnString(
      'b',
      this,
    );
    c = _i1.ColumnString(
      'c',
      this,
    );
    d = _i1.ColumnString(
      'd',
      this,
    );
    answer = _i1.ColumnString(
      'answer',
      this,
    );
    point = _i1.ColumnInt(
      'point',
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
  }

  late final _i1.ColumnString content;

  late final _i1.ColumnString a;

  late final _i1.ColumnString b;

  late final _i1.ColumnString c;

  late final _i1.ColumnString d;

  late final _i1.ColumnString answer;

  late final _i1.ColumnInt point;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.CategoryQuestionTable? ___categories;

  _i1.ManyRelation<_i2.CategoryQuestionTable>? _categories;

  _i2.QuizQuestionTable? ___quizs;

  _i1.ManyRelation<_i2.QuizQuestionTable>? _quizs;

  _i2.CategoryQuestionTable get __categories {
    if (___categories != null) return ___categories!;
    ___categories = _i1.createRelationTable(
      relationFieldName: '__categories',
      field: Question.t.id,
      foreignField: _i2.CategoryQuestion.t.questionId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CategoryQuestionTable(tableRelation: foreignTableRelation),
    );
    return ___categories!;
  }

  _i2.QuizQuestionTable get __quizs {
    if (___quizs != null) return ___quizs!;
    ___quizs = _i1.createRelationTable(
      relationFieldName: '__quizs',
      field: Question.t.id,
      foreignField: _i2.QuizQuestion.t.questionId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuizQuestionTable(tableRelation: foreignTableRelation),
    );
    return ___quizs!;
  }

  _i1.ManyRelation<_i2.CategoryQuestionTable> get categories {
    if (_categories != null) return _categories!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'categories',
      field: Question.t.id,
      foreignField: _i2.CategoryQuestion.t.questionId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CategoryQuestionTable(tableRelation: foreignTableRelation),
    );
    _categories = _i1.ManyRelation<_i2.CategoryQuestionTable>(
      tableWithRelations: relationTable,
      table: _i2.CategoryQuestionTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _categories!;
  }

  _i1.ManyRelation<_i2.QuizQuestionTable> get quizs {
    if (_quizs != null) return _quizs!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'quizs',
      field: Question.t.id,
      foreignField: _i2.QuizQuestion.t.questionId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuizQuestionTable(tableRelation: foreignTableRelation),
    );
    _quizs = _i1.ManyRelation<_i2.QuizQuestionTable>(
      tableWithRelations: relationTable,
      table: _i2.QuizQuestionTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _quizs!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        content,
        a,
        b,
        c,
        d,
        answer,
        point,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'categories') {
      return __categories;
    }
    if (relationField == 'quizs') {
      return __quizs;
    }
    return null;
  }
}

class QuestionInclude extends _i1.IncludeObject {
  QuestionInclude._({
    _i2.CategoryQuestionIncludeList? categories,
    _i2.QuizQuestionIncludeList? quizs,
  }) {
    _categories = categories;
    _quizs = quizs;
  }

  _i2.CategoryQuestionIncludeList? _categories;

  _i2.QuizQuestionIncludeList? _quizs;

  @override
  Map<String, _i1.Include?> get includes => {
        'categories': _categories,
        'quizs': _quizs,
      };

  @override
  _i1.Table get table => Question.t;
}

class QuestionIncludeList extends _i1.IncludeList {
  QuestionIncludeList._({
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Question.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Question.t;
}

class QuestionRepository {
  const QuestionRepository._();

  final attach = const QuestionAttachRepository._();

  final attachRow = const QuestionAttachRowRepository._();

  final detach = const QuestionDetachRepository._();

  final detachRow = const QuestionDetachRowRepository._();

  Future<List<Question>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.db.find<Question>(
      where: where?.call(Question.t),
      orderBy: orderBy?.call(Question.t),
      orderByList: orderByList?.call(Question.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Question?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.db.findFirstRow<Question>(
      where: where?.call(Question.t),
      orderBy: orderBy?.call(Question.t),
      orderByList: orderByList?.call(Question.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Question?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.db.findById<Question>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Question>> insert(
    _i1.Session session,
    List<Question> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Question>(
      rows,
      transaction: transaction,
    );
  }

  Future<Question> insertRow(
    _i1.Session session,
    Question row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Question>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Question>> update(
    _i1.Session session,
    List<Question> rows, {
    _i1.ColumnSelections<QuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Question>(
      rows,
      columns: columns?.call(Question.t),
      transaction: transaction,
    );
  }

  Future<Question> updateRow(
    _i1.Session session,
    Question row, {
    _i1.ColumnSelections<QuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Question>(
      row,
      columns: columns?.call(Question.t),
      transaction: transaction,
    );
  }

  Future<List<Question>> delete(
    _i1.Session session,
    List<Question> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Question>(
      rows,
      transaction: transaction,
    );
  }

  Future<Question> deleteRow(
    _i1.Session session,
    Question row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Question>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Question>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuestionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Question>(
      where: where(Question.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Question>(
      where: where?.call(Question.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class QuestionAttachRepository {
  const QuestionAttachRepository._();

  Future<void> categories(
    _i1.Session session,
    Question question,
    List<_i2.CategoryQuestion> categoryQuestion,
  ) async {
    if (categoryQuestion.any((e) => e.id == null)) {
      throw ArgumentError.notNull('categoryQuestion.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $categoryQuestion = categoryQuestion
        .map((e) => e.copyWith(questionId: question.id))
        .toList();
    await session.db.update<_i2.CategoryQuestion>(
      $categoryQuestion,
      columns: [_i2.CategoryQuestion.t.questionId],
    );
  }

  Future<void> quizs(
    _i1.Session session,
    Question question,
    List<_i2.QuizQuestion> quizQuestion,
  ) async {
    if (quizQuestion.any((e) => e.id == null)) {
      throw ArgumentError.notNull('quizQuestion.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $quizQuestion =
        quizQuestion.map((e) => e.copyWith(questionId: question.id)).toList();
    await session.db.update<_i2.QuizQuestion>(
      $quizQuestion,
      columns: [_i2.QuizQuestion.t.questionId],
    );
  }
}

class QuestionAttachRowRepository {
  const QuestionAttachRowRepository._();

  Future<void> categories(
    _i1.Session session,
    Question question,
    _i2.CategoryQuestion categoryQuestion,
  ) async {
    if (categoryQuestion.id == null) {
      throw ArgumentError.notNull('categoryQuestion.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $categoryQuestion = categoryQuestion.copyWith(questionId: question.id);
    await session.db.updateRow<_i2.CategoryQuestion>(
      $categoryQuestion,
      columns: [_i2.CategoryQuestion.t.questionId],
    );
  }

  Future<void> quizs(
    _i1.Session session,
    Question question,
    _i2.QuizQuestion quizQuestion,
  ) async {
    if (quizQuestion.id == null) {
      throw ArgumentError.notNull('quizQuestion.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $quizQuestion = quizQuestion.copyWith(questionId: question.id);
    await session.db.updateRow<_i2.QuizQuestion>(
      $quizQuestion,
      columns: [_i2.QuizQuestion.t.questionId],
    );
  }
}

class QuestionDetachRepository {
  const QuestionDetachRepository._();

  Future<void> quizs(
    _i1.Session session,
    List<_i2.QuizQuestion> quizQuestion,
  ) async {
    if (quizQuestion.any((e) => e.id == null)) {
      throw ArgumentError.notNull('quizQuestion.id');
    }

    var $quizQuestion =
        quizQuestion.map((e) => e.copyWith(questionId: null)).toList();
    await session.db.update<_i2.QuizQuestion>(
      $quizQuestion,
      columns: [_i2.QuizQuestion.t.questionId],
    );
  }
}

class QuestionDetachRowRepository {
  const QuestionDetachRowRepository._();

  Future<void> quizs(
    _i1.Session session,
    _i2.QuizQuestion quizQuestion,
  ) async {
    if (quizQuestion.id == null) {
      throw ArgumentError.notNull('quizQuestion.id');
    }

    var $quizQuestion = quizQuestion.copyWith(questionId: null);
    await session.db.updateRow<_i2.QuizQuestion>(
      $quizQuestion,
      columns: [_i2.QuizQuestion.t.questionId],
    );
  }
}
