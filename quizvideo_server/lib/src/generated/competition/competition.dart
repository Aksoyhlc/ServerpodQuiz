/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import '../protocol.dart' as _i3;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Competition extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Competition._({
    int? id,
    required this.identifier,
    required this.user1Id,
    this.user1,
    required this.user2Id,
    this.user2,
    required this.type,
    required this.typeId,
    this.createdAt,
    this.questions,
  }) : super(id);

  factory Competition({
    int? id,
    required _i1.UuidValue identifier,
    required int user1Id,
    _i2.UserInfo? user1,
    required int user2Id,
    _i2.UserInfo? user2,
    required _i3.QuizResultType type,
    required int typeId,
    DateTime? createdAt,
    List<_i3.Question>? questions,
  }) = _CompetitionImpl;

  factory Competition.fromJson(Map<String, dynamic> jsonSerialization) {
    return Competition(
      id: jsonSerialization['id'] as int?,
      identifier:
          _i1.UuidValueJsonExtension.fromJson(jsonSerialization['identifier']),
      user1Id: jsonSerialization['user1Id'] as int,
      user1: jsonSerialization['user1'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user1'] as Map<String, dynamic>)),
      user2Id: jsonSerialization['user2Id'] as int,
      user2: jsonSerialization['user2'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user2'] as Map<String, dynamic>)),
      type: _i3.QuizResultType.fromJson((jsonSerialization['type'] as String)),
      typeId: jsonSerialization['typeId'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      questions: (jsonSerialization['questions'] as List?)
          ?.map((e) => _i3.Question.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = CompetitionTable();

  static const db = CompetitionRepository._();

  _i1.UuidValue identifier;

  int user1Id;

  _i2.UserInfo? user1;

  int user2Id;

  _i2.UserInfo? user2;

  _i3.QuizResultType type;

  int typeId;

  DateTime? createdAt;

  List<_i3.Question>? questions;

  @override
  _i1.Table get table => t;

  Competition copyWith({
    int? id,
    _i1.UuidValue? identifier,
    int? user1Id,
    _i2.UserInfo? user1,
    int? user2Id,
    _i2.UserInfo? user2,
    _i3.QuizResultType? type,
    int? typeId,
    DateTime? createdAt,
    List<_i3.Question>? questions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'identifier': identifier.toJson(),
      'user1Id': user1Id,
      if (user1 != null) 'user1': user1?.toJson(),
      'user2Id': user2Id,
      if (user2 != null) 'user2': user2?.toJson(),
      'type': type.toJson(),
      'typeId': typeId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (questions != null)
        'questions': questions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'identifier': identifier.toJson(),
      'user1Id': user1Id,
      if (user1 != null) 'user1': user1?.toJsonForProtocol(),
      'user2Id': user2Id,
      if (user2 != null) 'user2': user2?.toJsonForProtocol(),
      'type': type.toJson(),
      'typeId': typeId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (questions != null)
        'questions':
            questions?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static CompetitionInclude include({
    _i2.UserInfoInclude? user1,
    _i2.UserInfoInclude? user2,
  }) {
    return CompetitionInclude._(
      user1: user1,
      user2: user2,
    );
  }

  static CompetitionIncludeList includeList({
    _i1.WhereExpressionBuilder<CompetitionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompetitionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompetitionTable>? orderByList,
    CompetitionInclude? include,
  }) {
    return CompetitionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Competition.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Competition.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CompetitionImpl extends Competition {
  _CompetitionImpl({
    int? id,
    required _i1.UuidValue identifier,
    required int user1Id,
    _i2.UserInfo? user1,
    required int user2Id,
    _i2.UserInfo? user2,
    required _i3.QuizResultType type,
    required int typeId,
    DateTime? createdAt,
    List<_i3.Question>? questions,
  }) : super._(
          id: id,
          identifier: identifier,
          user1Id: user1Id,
          user1: user1,
          user2Id: user2Id,
          user2: user2,
          type: type,
          typeId: typeId,
          createdAt: createdAt,
          questions: questions,
        );

  @override
  Competition copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? identifier,
    int? user1Id,
    Object? user1 = _Undefined,
    int? user2Id,
    Object? user2 = _Undefined,
    _i3.QuizResultType? type,
    int? typeId,
    Object? createdAt = _Undefined,
    Object? questions = _Undefined,
  }) {
    return Competition(
      id: id is int? ? id : this.id,
      identifier: identifier ?? this.identifier,
      user1Id: user1Id ?? this.user1Id,
      user1: user1 is _i2.UserInfo? ? user1 : this.user1?.copyWith(),
      user2Id: user2Id ?? this.user2Id,
      user2: user2 is _i2.UserInfo? ? user2 : this.user2?.copyWith(),
      type: type ?? this.type,
      typeId: typeId ?? this.typeId,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      questions: questions is List<_i3.Question>?
          ? questions
          : this.questions?.clone(),
    );
  }
}

class CompetitionTable extends _i1.Table {
  CompetitionTable({super.tableRelation}) : super(tableName: 'competition') {
    identifier = _i1.ColumnUuid(
      'identifier',
      this,
    );
    user1Id = _i1.ColumnInt(
      'user1Id',
      this,
    );
    user2Id = _i1.ColumnInt(
      'user2Id',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    typeId = _i1.ColumnInt(
      'typeId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnUuid identifier;

  late final _i1.ColumnInt user1Id;

  _i2.UserInfoTable? _user1;

  late final _i1.ColumnInt user2Id;

  _i2.UserInfoTable? _user2;

  late final _i1.ColumnEnum<_i3.QuizResultType> type;

  late final _i1.ColumnInt typeId;

  late final _i1.ColumnDateTime createdAt;

  _i2.UserInfoTable get user1 {
    if (_user1 != null) return _user1!;
    _user1 = _i1.createRelationTable(
      relationFieldName: 'user1',
      field: Competition.t.user1Id,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _user1!;
  }

  _i2.UserInfoTable get user2 {
    if (_user2 != null) return _user2!;
    _user2 = _i1.createRelationTable(
      relationFieldName: 'user2',
      field: Competition.t.user2Id,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _user2!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        identifier,
        user1Id,
        user2Id,
        type,
        typeId,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user1') {
      return user1;
    }
    if (relationField == 'user2') {
      return user2;
    }
    return null;
  }
}

class CompetitionInclude extends _i1.IncludeObject {
  CompetitionInclude._({
    _i2.UserInfoInclude? user1,
    _i2.UserInfoInclude? user2,
  }) {
    _user1 = user1;
    _user2 = user2;
  }

  _i2.UserInfoInclude? _user1;

  _i2.UserInfoInclude? _user2;

  @override
  Map<String, _i1.Include?> get includes => {
        'user1': _user1,
        'user2': _user2,
      };

  @override
  _i1.Table get table => Competition.t;
}

class CompetitionIncludeList extends _i1.IncludeList {
  CompetitionIncludeList._({
    _i1.WhereExpressionBuilder<CompetitionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Competition.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Competition.t;
}

class CompetitionRepository {
  const CompetitionRepository._();

  final attachRow = const CompetitionAttachRowRepository._();

  Future<List<Competition>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompetitionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompetitionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompetitionTable>? orderByList,
    _i1.Transaction? transaction,
    CompetitionInclude? include,
  }) async {
    return session.db.find<Competition>(
      where: where?.call(Competition.t),
      orderBy: orderBy?.call(Competition.t),
      orderByList: orderByList?.call(Competition.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Competition?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompetitionTable>? where,
    int? offset,
    _i1.OrderByBuilder<CompetitionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompetitionTable>? orderByList,
    _i1.Transaction? transaction,
    CompetitionInclude? include,
  }) async {
    return session.db.findFirstRow<Competition>(
      where: where?.call(Competition.t),
      orderBy: orderBy?.call(Competition.t),
      orderByList: orderByList?.call(Competition.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Competition?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CompetitionInclude? include,
  }) async {
    return session.db.findById<Competition>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Competition>> insert(
    _i1.Session session,
    List<Competition> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Competition>(
      rows,
      transaction: transaction,
    );
  }

  Future<Competition> insertRow(
    _i1.Session session,
    Competition row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Competition>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Competition>> update(
    _i1.Session session,
    List<Competition> rows, {
    _i1.ColumnSelections<CompetitionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Competition>(
      rows,
      columns: columns?.call(Competition.t),
      transaction: transaction,
    );
  }

  Future<Competition> updateRow(
    _i1.Session session,
    Competition row, {
    _i1.ColumnSelections<CompetitionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Competition>(
      row,
      columns: columns?.call(Competition.t),
      transaction: transaction,
    );
  }

  Future<List<Competition>> delete(
    _i1.Session session,
    List<Competition> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Competition>(
      rows,
      transaction: transaction,
    );
  }

  Future<Competition> deleteRow(
    _i1.Session session,
    Competition row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Competition>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Competition>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CompetitionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Competition>(
      where: where(Competition.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompetitionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Competition>(
      where: where?.call(Competition.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CompetitionAttachRowRepository {
  const CompetitionAttachRowRepository._();

  Future<void> user1(
    _i1.Session session,
    Competition competition,
    _i2.UserInfo user1,
  ) async {
    if (competition.id == null) {
      throw ArgumentError.notNull('competition.id');
    }
    if (user1.id == null) {
      throw ArgumentError.notNull('user1.id');
    }

    var $competition = competition.copyWith(user1Id: user1.id);
    await session.db.updateRow<Competition>(
      $competition,
      columns: [Competition.t.user1Id],
    );
  }

  Future<void> user2(
    _i1.Session session,
    Competition competition,
    _i2.UserInfo user2,
  ) async {
    if (competition.id == null) {
      throw ArgumentError.notNull('competition.id');
    }
    if (user2.id == null) {
      throw ArgumentError.notNull('user2.id');
    }

    var $competition = competition.copyWith(user2Id: user2.id);
    await session.db.updateRow<Competition>(
      $competition,
      columns: [Competition.t.user2Id],
    );
  }
}
