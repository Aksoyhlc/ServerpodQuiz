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
import 'protocol.dart' as _i3;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class OnlineUser extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  OnlineUser._({
    int? id,
    required this.userId,
    this.user,
    required this.type,
    required this.typeId,
    this.createdAt,
  }) : super(id);

  factory OnlineUser({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    required _i3.QuizResultType type,
    required int typeId,
    DateTime? createdAt,
  }) = _OnlineUserImpl;

  factory OnlineUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return OnlineUser(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      type: _i3.QuizResultType.fromJson((jsonSerialization['type'] as String)),
      typeId: jsonSerialization['typeId'] as int,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = OnlineUserTable();

  static const db = OnlineUserRepository._();

  int userId;

  _i2.UserInfo? user;

  _i3.QuizResultType type;

  int typeId;

  DateTime? createdAt;

  @override
  _i1.Table get table => t;

  OnlineUser copyWith({
    int? id,
    int? userId,
    _i2.UserInfo? user,
    _i3.QuizResultType? type,
    int? typeId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'type': type.toJson(),
      'typeId': typeId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'type': type.toJson(),
      'typeId': typeId,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
    };
  }

  static OnlineUserInclude include({_i2.UserInfoInclude? user}) {
    return OnlineUserInclude._(user: user);
  }

  static OnlineUserIncludeList includeList({
    _i1.WhereExpressionBuilder<OnlineUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OnlineUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OnlineUserTable>? orderByList,
    OnlineUserInclude? include,
  }) {
    return OnlineUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OnlineUser.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(OnlineUser.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OnlineUserImpl extends OnlineUser {
  _OnlineUserImpl({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    required _i3.QuizResultType type,
    required int typeId,
    DateTime? createdAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          type: type,
          typeId: typeId,
          createdAt: createdAt,
        );

  @override
  OnlineUser copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    _i3.QuizResultType? type,
    int? typeId,
    Object? createdAt = _Undefined,
  }) {
    return OnlineUser(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserInfo? ? user : this.user?.copyWith(),
      type: type ?? this.type,
      typeId: typeId ?? this.typeId,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
    );
  }
}

class OnlineUserTable extends _i1.Table {
  OnlineUserTable({super.tableRelation}) : super(tableName: 'online_user') {
    userId = _i1.ColumnInt(
      'userId',
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

  late final _i1.ColumnInt userId;

  _i2.UserInfoTable? _user;

  late final _i1.ColumnEnum<_i3.QuizResultType> type;

  late final _i1.ColumnInt typeId;

  late final _i1.ColumnDateTime createdAt;

  _i2.UserInfoTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: OnlineUser.t.userId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        type,
        typeId,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class OnlineUserInclude extends _i1.IncludeObject {
  OnlineUserInclude._({_i2.UserInfoInclude? user}) {
    _user = user;
  }

  _i2.UserInfoInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table get table => OnlineUser.t;
}

class OnlineUserIncludeList extends _i1.IncludeList {
  OnlineUserIncludeList._({
    _i1.WhereExpressionBuilder<OnlineUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(OnlineUser.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => OnlineUser.t;
}

class OnlineUserRepository {
  const OnlineUserRepository._();

  final attachRow = const OnlineUserAttachRowRepository._();

  Future<List<OnlineUser>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OnlineUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OnlineUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OnlineUserTable>? orderByList,
    _i1.Transaction? transaction,
    OnlineUserInclude? include,
  }) async {
    return session.db.find<OnlineUser>(
      where: where?.call(OnlineUser.t),
      orderBy: orderBy?.call(OnlineUser.t),
      orderByList: orderByList?.call(OnlineUser.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<OnlineUser?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OnlineUserTable>? where,
    int? offset,
    _i1.OrderByBuilder<OnlineUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OnlineUserTable>? orderByList,
    _i1.Transaction? transaction,
    OnlineUserInclude? include,
  }) async {
    return session.db.findFirstRow<OnlineUser>(
      where: where?.call(OnlineUser.t),
      orderBy: orderBy?.call(OnlineUser.t),
      orderByList: orderByList?.call(OnlineUser.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<OnlineUser?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    OnlineUserInclude? include,
  }) async {
    return session.db.findById<OnlineUser>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<OnlineUser>> insert(
    _i1.Session session,
    List<OnlineUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<OnlineUser>(
      rows,
      transaction: transaction,
    );
  }

  Future<OnlineUser> insertRow(
    _i1.Session session,
    OnlineUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<OnlineUser>(
      row,
      transaction: transaction,
    );
  }

  Future<List<OnlineUser>> update(
    _i1.Session session,
    List<OnlineUser> rows, {
    _i1.ColumnSelections<OnlineUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<OnlineUser>(
      rows,
      columns: columns?.call(OnlineUser.t),
      transaction: transaction,
    );
  }

  Future<OnlineUser> updateRow(
    _i1.Session session,
    OnlineUser row, {
    _i1.ColumnSelections<OnlineUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<OnlineUser>(
      row,
      columns: columns?.call(OnlineUser.t),
      transaction: transaction,
    );
  }

  Future<List<OnlineUser>> delete(
    _i1.Session session,
    List<OnlineUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OnlineUser>(
      rows,
      transaction: transaction,
    );
  }

  Future<OnlineUser> deleteRow(
    _i1.Session session,
    OnlineUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<OnlineUser>(
      row,
      transaction: transaction,
    );
  }

  Future<List<OnlineUser>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OnlineUserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<OnlineUser>(
      where: where(OnlineUser.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OnlineUserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OnlineUser>(
      where: where?.call(OnlineUser.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class OnlineUserAttachRowRepository {
  const OnlineUserAttachRowRepository._();

  Future<void> user(
    _i1.Session session,
    OnlineUser onlineUser,
    _i2.UserInfo user,
  ) async {
    if (onlineUser.id == null) {
      throw ArgumentError.notNull('onlineUser.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $onlineUser = onlineUser.copyWith(userId: user.id);
    await session.db.updateRow<OnlineUser>(
      $onlineUser,
      columns: [OnlineUser.t.userId],
    );
  }
}
