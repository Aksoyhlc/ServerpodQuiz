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

abstract class User extends _i1.TableRow implements _i1.ProtocolSerialization {
  User._({
    int? id,
    required this.name,
    required this.userInfoId,
    this.userInfo,
    this.point,
    this.password,
  }) : super(id);

  factory User({
    int? id,
    required String name,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    String? point,
    String? password,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      point: jsonSerialization['point'] as String?,
      password: jsonSerialization['password'] as String?,
    );
  }

  static final t = UserTable();

  static const db = UserRepository._();

  String name;

  int userInfoId;

  _i2.UserInfo? userInfo;

  String? point;

  String? password;

  @override
  _i1.Table get table => t;

  User copyWith({
    int? id,
    String? name,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? point,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (point != null) 'point': point,
      if (password != null) 'password': password,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      if (point != null) 'point': point,
      if (password != null) 'password': password,
    };
  }

  static UserInclude include({_i2.UserInfoInclude? userInfo}) {
    return UserInclude._(userInfo: userInfo);
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String name,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    String? point,
    String? password,
  }) : super._(
          id: id,
          name: name,
          userInfoId: userInfoId,
          userInfo: userInfo,
          point: point,
          password: password,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    String? name,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? point = _Undefined,
    Object? password = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      point: point is String? ? point : this.point,
      password: password is String? ? password : this.password,
    );
  }
}

class UserTable extends _i1.Table {
  UserTable({super.tableRelation}) : super(tableName: 'user') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: User.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        userInfoId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    return null;
  }
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._({_i2.UserInfoInclude? userInfo}) {
    _userInfo = userInfo;
  }

  _i2.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {'userInfo': _userInfo};

  @override
  _i1.Table get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attachRow = const UserAttachRowRepository._();

  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    User user,
    _i2.UserInfo userInfo,
  ) async {
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $user = user.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<User>(
      $user,
      columns: [User.t.userInfoId],
    );
  }
}
