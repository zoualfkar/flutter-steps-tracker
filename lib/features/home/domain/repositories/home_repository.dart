import 'package:dartz/dartz.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/core/common/data/models/success_model/success_model.dart';
import 'package:steps_tracker/features/home/domain/entities/exchange_history_entity.dart';
import 'package:steps_tracker/features/home/domain/entities/my_reward_entity.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';

abstract class HomeRepository{

 Future<Either<ErrorModel,UserEntity>> getUserData();

 Future<Either<ErrorModel,SuccessModel>> saveUserData({
  required int count,
  required int totalCount,
  required int healthPoint,
 });

 Future<Either<ErrorModel,SuccessModel>> addExchangeToHistory({
  required int count,
  required String date,
 });

 Future<Either<ErrorModel,List<UserEntity>>> getUsers();


 Future<Either<ErrorModel,List<ExchangeHistoryEntity>>> getExchangeHistory();

 Future<Either<ErrorModel,SuccessModel>> getReward({
 required String partnerId,
  required int rewardId
});


 Future<Either<ErrorModel,List<MyRewardEntity>>> getUserReward();

}