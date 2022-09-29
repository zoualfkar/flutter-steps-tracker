// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RewardModel _$RewardModelFromJson(Map<String, dynamic> json) => RewardModel(
      json['rewardId'] as int,
      UserModel.fromJson(json['partner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RewardModelToJson(RewardModel instance) =>
    <String, dynamic>{
      'rewardId': instance.rewardId,
      'partner': instance.partner,
    };
