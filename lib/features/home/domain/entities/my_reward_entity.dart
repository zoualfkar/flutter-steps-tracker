import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';

class MyRewardEntity{
  int id;
  UserEntity partner;

  MyRewardEntity({
    required this.id,
    required this.partner,
});
}