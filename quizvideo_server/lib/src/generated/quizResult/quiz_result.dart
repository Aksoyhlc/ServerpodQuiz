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

abstract class QuizResult extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  QuizResult._({
    int? id,
    required this.typeId,
    this.userId,
    required this.type,
    required this.correctCount,
    required this.wrongCount,
    required this.passedCount,
    required this.point,
    this.createdAt,
    this.startedAt,
    this.endAt,
    this.typeText,
  }) : super(id);

  factory QuizResult({
    int? id,
    required int typeId,
    int? userId,
    required _i2.QuizResultType type,
    required int correctCount,
    required int wrongCount,
    required int passedCount,
    required int point,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? endAt,
    String? typeText,
  }) = _QuizResultImpl;

  factory QuizResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizResult(
      id: jsonSerialization['id'] as int?,
      typeId: jsonSerialization['typeId'] as int,
      userId: jsonSerialization['userId'] as int?,
      type: _i2.QuizResultType.fromJson((jsonSerialization['type'] as String)),
      correctCount: jsonSerialization['correctCount'] as int,
      wrongCount: jsonSerialization['wrongCount'] as int,
      passedCount: jsonSerialization['passedCount'] as int,
      point: jsonSerialization['point'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      startedAt: jsonSerialization['startedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startedAt']),
      endAt: jsonSerialization['endAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endAt']),
      typeText: jsonSerialization['typeText'] as String?,
    );
  }

  static final t = QuizResultTable();

  static const db = QuizResultRepository._();

  int typeId;

  int? userId;

  _i2.QuizResultType type;

  int correctCount;

  int wrongCount;

  int passedCount;

  int point;

  DateTime? createdAt;

  DateTime? startedAt;

  DateTime? endAt;

  String? typeText;

  @override
  _i1.Table get table => t;

  QuizResult copyWith({
    int? id,
    int? typeId,
    int? userId,
    _i2.QuizResultType? type,
    int? correctCount,
    int? wrongCount,
    int? passedCount,
    int? point,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? endAt,
    String? typeText,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'typeId': typeId,
      if (userId != null) 'userId': userId,
      'type': type.toJson(),
      'correctCount': correctCount,
      'wrongCount': wrongCount,
      'passedCount': passedCount,
      'point': point,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (endAt != null) 'endAt': endAt?.toJson(),
      if (typeText != null) 'typeText': typeText,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'typeId': typeId,
      if (userId != null) 'userId': userId,
      'type': type.toJson(),
      'correctCount': correctCount,
      'wrongCount': wrongCount,
      'passedCount': passedCount,
      'point': point,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (startedAt != null) 'startedAt': startedAt?.toJson(),
      if (endAt != null) 'endAt': endAt?.toJson(),
      if (typeText != null) 'typeText': typeText,
    };
  }

  static QuizResultInclude include() {
    return QuizResultInclude._();
  }

  static QuizResultIncludeList includeList({
    _i1.WhereExpressionBuilder<QuizResultTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizResultTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizResultTable>? orderByList,
    QuizResultInclude? include,
  }) {
    return QuizResultIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(QuizResult.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(QuizResult.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizResultImpl extends QuizResult {
  _QuizResultImpl({
    int? id,
    required int typeId,
    int? userId,
    required _i2.QuizResultType type,
    required int correctCount,
    required int wrongCount,
    required int passedCount,
    required int point,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? endAt,
    String? typeText,
  }) : super._(
          id: id,
          typeId: typeId,
          userId: userId,
          type: type,
          correctCount: correctCount,
          wrongCount: wrongCount,
          passedCount: passedCount,
          point: point,
          createdAt: createdAt,
          startedAt: startedAt,
          endAt: endAt,
          typeText: typeText,
        );

  @override
  QuizResult copyWith({
    Object? id = _Undefined,
    int? typeId,
    Object? userId = _Undefined,
    _i2.QuizResultType? type,
    int? correctCount,
    int? wrongCount,
    int? passedCount,
    int? point,
    Object? createdAt = _Undefined,
    Object? startedAt = _Undefined,
    Object? endAt = _Undefined,
    Object? typeText = _Undefined,
  }) {
    return QuizResult(
      id: id is int? ? id : this.id,
      typeId: typeId ?? this.typeId,
      userId: userId is int? ? userId : this.userId,
      type: type ?? this.type,
      correctCount: correctCount ?? this.correctCount,
      wrongCount: wrongCount ?? this.wrongCount,
      passedCount: passedCount ?? this.passedCount,
      point: point ?? this.point,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      startedAt: startedAt is DateTime? ? startedAt : this.startedAt,
      endAt: endAt is DateTime? ? endAt : this.endAt,
      typeText: typeText is String? ? typeText : this.typeText,
    );
  }
}

class QuizResultTable extends _i1.Table {
  QuizResultTable({super.tableRelation}) : super(tableName: 'quiz_result') {
    typeId = _i1.ColumnInt(
      'typeId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    correctCount = _i1.ColumnInt(
      'correctCount',
      this,
    );
    wrongCount = _i1.ColumnInt(
      'wrongCount',
      this,
    );
    passedCount = _i1.ColumnInt(
      'passedCount',
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
    startedAt = _i1.ColumnDateTime(
      'startedAt',
      this,
    );
    endAt = _i1.ColumnDateTime(
      'endAt',
      this,
    );
  }

  late final _i1.ColumnInt typeId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnEnum<_i2.QuizResultType> type;

  late final _i1.ColumnInt correctCount;

  late final _i1.ColumnInt wrongCount;

  late final _i1.ColumnInt passedCount;

  late final _i1.ColumnInt point;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime startedAt;

  late final _i1.ColumnDateTime endAt;

  @override
  List<_i1.Column> get columns => [
        id,
        typeId,
        userId,
        type,
        correctCount,
        wrongCount,
        passedCount,
        point,
        createdAt,
        startedAt,
        endAt,
      ];
}

class QuizResultInclude extends _i1.IncludeObject {
  QuizResultInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => QuizResult.t;
}

class QuizResultIncludeList extends _i1.IncludeList {
  QuizResultIncludeList._({
    _i1.WhereExpressionBuilder<QuizResultTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(QuizResult.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => QuizResult.t;
}

class QuizResultRepository {
  const QuizResultRepository._();

  Future<List<QuizResult>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizResultTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizResultTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizResultTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<QuizResult>(
      where: where?.call(QuizResult.t),
      orderBy: orderBy?.call(QuizResult.t),
      orderByList: orderByList?.call(QuizResult.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<QuizResult?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizResultTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuizResultTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizResultTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<QuizResult>(
      where: where?.call(QuizResult.t),
      orderBy: orderBy?.call(QuizResult.t),
      orderByList: orderByList?.call(QuizResult.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<QuizResult?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<QuizResult>(
      id,
      transaction: transaction,
    );
  }

  Future<List<QuizResult>> insert(
    _i1.Session session,
    List<QuizResult> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<QuizResult>(
      rows,
      transaction: transaction,
    );
  }

  Future<QuizResult> insertRow(
    _i1.Session session,
    QuizResult row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<QuizResult>(
      row,
      transaction: transaction,
    );
  }

  Future<List<QuizResult>> update(
    _i1.Session session,
    List<QuizResult> rows, {
    _i1.ColumnSelections<QuizResultTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<QuizResult>(
      rows,
      columns: columns?.call(QuizResult.t),
      transaction: transaction,
    );
  }

  Future<QuizResult> updateRow(
    _i1.Session session,
    QuizResult row, {
    _i1.ColumnSelections<QuizResultTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<QuizResult>(
      row,
      columns: columns?.call(QuizResult.t),
      transaction: transaction,
    );
  }

  Future<List<QuizResult>> delete(
    _i1.Session session,
    List<QuizResult> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<QuizResult>(
      rows,
      transaction: transaction,
    );
  }

  Future<QuizResult> deleteRow(
    _i1.Session session,
    QuizResult row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<QuizResult>(
      row,
      transaction: transaction,
    );
  }

  Future<List<QuizResult>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuizResultTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<QuizResult>(
      where: where(QuizResult.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizResultTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<QuizResult>(
      where: where?.call(QuizResult.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
