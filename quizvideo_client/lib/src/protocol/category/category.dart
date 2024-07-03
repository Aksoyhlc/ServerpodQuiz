/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../protocol.dart' as _i2;

abstract class Category implements _i1.SerializableModel {
  Category._({
    this.id,
    required this.name,
    this.image,
    this.questionIds,
    this.questions,
  });

  factory Category({
    int? id,
    required String name,
    String? image,
    List<int?>? questionIds,
    List<_i2.CategoryQuestion>? questions,
  }) = _CategoryImpl;

  factory Category.fromJson(Map<String, dynamic> jsonSerialization) {
    return Category(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      image: jsonSerialization['image'] as String?,
      questionIds: (jsonSerialization['questionIds'] as List?)
          ?.map((e) => e as int?)
          .toList(),
      questions: (jsonSerialization['questions'] as List?)
          ?.map(
              (e) => _i2.CategoryQuestion.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String? image;

  List<int?>? questionIds;

  List<_i2.CategoryQuestion>? questions;

  Category copyWith({
    int? id,
    String? name,
    String? image,
    List<int?>? questionIds,
    List<_i2.CategoryQuestion>? questions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (image != null) 'image': image,
      if (questionIds != null) 'questionIds': questionIds?.toJson(),
      if (questions != null)
        'questions': questions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategoryImpl extends Category {
  _CategoryImpl({
    int? id,
    required String name,
    String? image,
    List<int?>? questionIds,
    List<_i2.CategoryQuestion>? questions,
  }) : super._(
          id: id,
          name: name,
          image: image,
          questionIds: questionIds,
          questions: questions,
        );

  @override
  Category copyWith({
    Object? id = _Undefined,
    String? name,
    Object? image = _Undefined,
    Object? questionIds = _Undefined,
    Object? questions = _Undefined,
  }) {
    return Category(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      image: image is String? ? image : this.image,
      questionIds:
          questionIds is List<int?>? ? questionIds : this.questionIds?.clone(),
      questions: questions is List<_i2.CategoryQuestion>?
          ? questions
          : this.questions?.clone(),
    );
  }
}
