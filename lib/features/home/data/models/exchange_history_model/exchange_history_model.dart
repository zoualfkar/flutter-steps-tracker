

import 'package:json_annotation/json_annotation.dart';
import 'package:steps_tracker/core/utils/helpers/date_time_convert.dart';
import 'package:steps_tracker/features/home/domain/entities/exchange_history_entity.dart';

part 'exchange_history_model.g.dart';

@JsonSerializable()
class ExchangeHistoryModel{

  String? userId;
  int? count;
  String? date;

  ExchangeHistoryModel(this.userId, this.count, this.date);


  factory ExchangeHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeHistoryModelToJson(this);
}


extension MapToDomain on ExchangeHistoryModel {

  ExchangeHistoryEntity  toDomain(){
    return ExchangeHistoryEntity(
        userId: userId??'',
        count: count??0,
        date: date==null ? DateTime.now() : toLocalDate(date!));
  }
}