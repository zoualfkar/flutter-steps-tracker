// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeHistoryModel _$ExchangeHistoryModelFromJson(
        Map<String, dynamic> json) =>
    ExchangeHistoryModel(
      json['userId'] as String?,
      json['count'] as int?,
      json['date'] as String?,
    );

Map<String, dynamic> _$ExchangeHistoryModelToJson(
        ExchangeHistoryModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'count': instance.count,
      'date': instance.date,
    };
