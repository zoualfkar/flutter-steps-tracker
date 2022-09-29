// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['id'] as String?,
      json['name'] as String?,
      json['count'] as int?,
      json['totalCount'] as int?,
      json['healthPoint'] as int?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'totalCount': instance.totalCount,
      'healthPoint': instance.healthPoint,
    };
