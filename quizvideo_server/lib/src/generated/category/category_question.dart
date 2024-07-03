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

abstract class CategoryQuestion extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  CategoryQuestion._({
    int? id,
    required this.categoryId,
    this.category,
    required this.questionId,
    this.question,
    required this.createdAt,
  }) : super(id);

  factory CategoryQuestion({
    int? id,
    required int categoryId,
    _i2.Category? category,
    required int questionId,
    _i2.Question? question,
    required DateTime createdAt,
  }) = _CategoryQuestionImpl;

  factory CategoryQuestion.fromJson(Map<String, dynamic> jsonSerialization) {
    return CategoryQuestion(
      id: jsonSerialization['id'] as int?,
      categoryId: jsonSerialization['categoryId'] as int,
      category: jsonSerialization['category'] == null
          ? null
          : _i2.Category.fromJson(
              (jsonSerialization['category'] as Map<String, dynamic>)),
      questionId: jsonSerialization['questionId'] as int,
      question: jsonSerialization['question'] == null
          ? null
          : _i2.Question.fromJson(
              (jsonSerialization['question'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = CategoryQuestionTable();

  static const db = CategoryQuestionRepository._();

  int categoryId;

  _i2.Category? category;

  int questionId;

  _i2.Question? question;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

  CategoryQuestion copyWith({
    int? id,
    int? categoryId,
    _i2.Category? category,
    int? questionId,
    _i2.Question? question,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'categoryId': categoryId,
      if (category != null) 'category': category?.toJson(),
      'questionId': questionId,
      if (question != null) 'question': question?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'categoryId': categoryId,
      if (category != null) 'category': category?.toJsonForProtocol(),
      'questionId': questionId,
      if (question != null) 'question': question?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
    };
  }

  static CategoryQuestionInclude include({
    _i2.CategoryInclude? category,
    _i2.QuestionInclude? question,
  }) {
    return CategoryQuestionInclude._(
      category: category,
      question: question,
    );
  }

  static CategoryQuestionIncludeList includeList({
    _i1.WhereExpressionBuilder<CategoryQuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategoryQuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryQuestionTable>? orderByList,
    CategoryQuestionInclude? include,
  }) {
    return CategoryQuestionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CategoryQuestion.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CategoryQuestion.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategoryQuestionImpl extends CategoryQuestion {
  _CategoryQuestionImpl({
    int? id,
    required int categoryId,
    _i2.Category? category,
    required int questionId,
    _i2.Question? question,
    required DateTime createdAt,
  }) : super._(
          id: id,
          categoryId: categoryId,
          category: category,
          questionId: questionId,
          question: question,
          createdAt: createdAt,
        );

  @override
  CategoryQuestion copyWith({
    Object? id = _Undefined,
    int? categoryId,
    Object? category = _Undefined,
    int? questionId,
    Object? question = _Undefined,
    DateTime? createdAt,
  }) {
    return CategoryQuestion(
      id: id is int? ? id : this.id,
      categoryId: categoryId ?? this.categoryId,
      category:
          category is _i2.Category? ? category : this.category?.copyWith(),
      questionId: questionId ?? this.questionId,
      question:
          question is _i2.Question? ? question : this.question?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class CategoryQuestionTable extends _i1.Table {
  CategoryQuestionTable({super.tableRelation})
      : super(tableName: 'category_question') {
    categoryId = _i1.ColumnInt(
      'categoryId',
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

  late final _i1.ColumnInt categoryId;

  _i2.CategoryTable? _category;

  late final _i1.ColumnInt questionId;

  _i2.QuestionTable? _question;

  late final _i1.ColumnDateTime createdAt;

  _i2.CategoryTable get category {
    if (_category != null) return _category!;
    _category = _i1.createRelationTable(
      relationFieldName: 'category',
      field: CategoryQuestion.t.categoryId,
      foreignField: _i2.Category.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CategoryTable(tableRelation: foreignTableRelation),
    );
    return _category!;
  }

  _i2.QuestionTable get question {
    if (_question != null) return _question!;
    _question = _i1.createRelationTable(
      relationFieldName: 'question',
      field: CategoryQuestion.t.questionId,
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
        categoryId,
        questionId,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'category') {
      return category;
    }
    if (relationField == 'question') {
      return question;
    }
    return null;
  }
}

class CategoryQuestionInclude extends _i1.IncludeObject {
  CategoryQuestionInclude._({
    _i2.CategoryInclude? category,
    _i2.QuestionInclude? question,
  }) {
    _category = category;
    _question = question;
  }

  _i2.CategoryInclude? _category;

  _i2.QuestionInclude? _question;

  @override
  Map<String, _i1.Include?> get includes => {
        'category': _category,
        'question': _question,
      };

  @override
  _i1.Table get table => CategoryQuestion.t;
}

class CategoryQuestionIncludeList extends _i1.IncludeList {
  CategoryQuestionIncludeList._({
    _i1.WhereExpressionBuilder<CategoryQuestionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CategoryQuestion.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => CategoryQuestion.t;
}

class CategoryQuestionRepository {
  const CategoryQuestionRepository._();

  final attachRow = const CategoryQuestionAttachRowRepository._();

  Future<List<CategoryQuestion>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryQuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CategoryQuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryQuestionTable>? orderByList,
    _i1.Transaction? transaction,
    CategoryQuestionInclude? include,
  }) async {
    return session.db.find<CategoryQuestion>(
      where: where?.call(CategoryQuestion.t),
      orderBy: orderBy?.call(CategoryQuestion.t),
      orderByList: orderByList?.call(CategoryQuestion.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<CategoryQuestion?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryQuestionTable>? where,
    int? offset,
    _i1.OrderByBuilder<CategoryQuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CategoryQuestionTable>? orderByList,
    _i1.Transaction? transaction,
    CategoryQuestionInclude? include,
  }) async {
    return session.db.findFirstRow<CategoryQuestion>(
      where: where?.call(CategoryQuestion.t),
      orderBy: orderBy?.call(CategoryQuestion.t),
      orderByList: orderByList?.call(CategoryQuestion.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<CategoryQuestion?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CategoryQuestionInclude? include,
  }) async {
    return session.db.findById<CategoryQuestion>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<CategoryQuestion>> insert(
    _i1.Session session,
    List<CategoryQuestion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CategoryQuestion>(
      rows,
      transaction: transaction,
    );
  }

  Future<CategoryQuestion> insertRow(
    _i1.Session session,
    CategoryQuestion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CategoryQuestion>(
      row,
      transaction: transaction,
    );
  }

  Future<List<CategoryQuestion>> update(
    _i1.Session session,
    List<CategoryQuestion> rows, {
    _i1.ColumnSelections<CategoryQuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CategoryQuestion>(
      rows,
      columns: columns?.call(CategoryQuestion.t),
      transaction: transaction,
    );
  }

  Future<CategoryQuestion> updateRow(
    _i1.Session session,
    CategoryQuestion row, {
    _i1.ColumnSelections<CategoryQuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CategoryQuestion>(
      row,
      columns: columns?.call(CategoryQuestion.t),
      transaction: transaction,
    );
  }

  Future<List<CategoryQuestion>> delete(
    _i1.Session session,
    List<CategoryQuestion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CategoryQuestion>(
      rows,
      transaction: transaction,
    );
  }

  Future<CategoryQuestion> deleteRow(
    _i1.Session session,
    CategoryQuestion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CategoryQuestion>(
      row,
      transaction: transaction,
    );
  }

  Future<List<CategoryQuestion>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CategoryQuestionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CategoryQuestion>(
      where: where(CategoryQuestion.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CategoryQuestionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CategoryQuestion>(
      where: where?.call(CategoryQuestion.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CategoryQuestionAttachRowRepository {
  const CategoryQuestionAttachRowRepository._();

  Future<void> category(
    _i1.Session session,
    CategoryQuestion categoryQuestion,
    _i2.Category category,
  ) async {
    if (categoryQuestion.id == null) {
      throw ArgumentError.notNull('categoryQuestion.id');
    }
    if (category.id == null) {
      throw ArgumentError.notNull('category.id');
    }

    var $categoryQuestion = categoryQuestion.copyWith(categoryId: category.id);
    await session.db.updateRow<CategoryQuestion>(
      $categoryQuestion,
      columns: [CategoryQuestion.t.categoryId],
    );
  }

  Future<void> question(
    _i1.Session session,
    CategoryQuestion categoryQuestion,
    _i2.Question question,
  ) async {
    if (categoryQuestion.id == null) {
      throw ArgumentError.notNull('categoryQuestion.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $categoryQuestion = categoryQuestion.copyWith(questionId: question.id);
    await session.db.updateRow<CategoryQuestion>(
      $categoryQuestion,
      columns: [CategoryQuestion.t.questionId],
    );
  }
}
