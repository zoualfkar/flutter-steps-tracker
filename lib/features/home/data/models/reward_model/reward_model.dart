import 'package:json_annotation/json_annotation.dart';
import 'package:steps_tracker/features/home/data/models/user_model/user_model.dart';
import 'package:steps_tracker/features/home/domain/entities/my_reward_entity.dart';

part 'reward_model.g.dart';

@JsonSerializable()
class RewardModel{
  int rewardId;
  UserModel partner;

  RewardModel(this.rewardId, this.partner);

  factory RewardModel.fromJson(Map<String, dynamic> json) =>
      _$RewardModelFromJson(json);

  Map<String, dynamic> toJson() => _$RewardModelToJson(this);
}

extension MapToDomain on RewardModel {

  MyRewardEntity  toDomain(){
    return MyRewardEntity(
        id: rewardId,
        partner:  partner.toDomain()
    );
  }
}