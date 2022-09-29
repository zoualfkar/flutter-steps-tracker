import 'package:dartz/dartz.dart';
import 'package:steps_tracker/app/logic/app_settings.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/core/common/data/models/success_model/success_model.dart';
import 'package:steps_tracker/features/home/data/data_source/remote/home_datasource.dart';
import 'package:steps_tracker/features/home/data/models/exchange_history_model/exchange_history_model.dart';
import 'package:steps_tracker/features/home/data/models/reward_model/reward_model.dart';
import 'package:steps_tracker/features/home/data/models/user_model/user_model.dart';
import 'package:steps_tracker/features/home/domain/entities/exchange_history_entity.dart';
import 'package:steps_tracker/features/home/domain/entities/my_reward_entity.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';
import 'package:steps_tracker/features/home/domain/repositories/home_repository.dart';
import 'package:steps_tracker/injections.dart';

class HomeRepositoryImpl extends HomeRepository{

  HomeDataSource dataSource;


  HomeRepositoryImpl({
    required this.dataSource,
});

  @override
  Future<Either<ErrorModel, UserEntity>> getUserData() async{
   try{
     var response =await dataSource.getUserData();
     var user =UserModel.fromJson(response);
     return right(user.toDomain());
   }catch(e){
     return left(const ErrorModel(error: Error(message: 'Network Error')));
   }
  }

  @override
  Future<Either<ErrorModel, SuccessModel>> saveUserData({
    required int count,
    required int totalCount,
    required int healthPoint,
  }) async{
    try{
      await dataSource.saveUserData(
          count: count,
          totalCount: totalCount,
          healthPoint: healthPoint);
      return right(const SuccessModel());
    }catch(e){
      return left(const ErrorModel(error: Error(message: 'Network Error')));
    }
  }

  @override
  Future<Either<ErrorModel, SuccessModel>> addExchangeToHistory({required int count, required String date}) async{
    try{
      await dataSource.addToHistory(
          userId: serviceLocator<AppSettings>().userId??'',
          count: count,
          date: date);
      return right(const SuccessModel());
    }catch(e){
      return left(const ErrorModel(error: Error(message: 'Network Error')));
    }
  }

  @override
  Future<Either<ErrorModel, List<ExchangeHistoryEntity>>> getExchangeHistory() async{
    try{
      var response =await dataSource.getExchangeHistory(
          userId: serviceLocator<AppSettings>().userId??'',
         );
      List<ExchangeHistoryEntity> exchanges =response
          .map((e) => ExchangeHistoryModel.fromJson(e).toDomain()).toList();
      return right(exchanges);
    }catch(e){
      return left(const ErrorModel(error: Error(message: 'Network Error')));
    }
  }

  @override
  Future<Either<ErrorModel, List<UserEntity>>> getUsers() async{
    try{
      var response =await dataSource.getUsers();
      List<UserEntity> users =response
          .map((e) => UserModel.fromJson(e).toDomain()).toList();
      return right(users);
    }catch(e){
      return left(const ErrorModel(error: Error(message: 'Network Error')));
    }
  }

  @override
  Future<Either<ErrorModel, SuccessModel>> getReward({required String partnerId, required int rewardId}) async{
    try{
      var response =await dataSource.getReward(
        partnerId:partnerId,
        rewardId :rewardId
      );
      response
          .map((e) => UserModel.fromJson(e).toDomain()).toList();
      return right(const SuccessModel());
    }catch(e){
      return left(const ErrorModel(error: Error(message: 'Network Error')));
    }
  }

  @override
  Future<Either<ErrorModel, List<MyRewardEntity>>> getUserReward() async{
    try{
      var response =await dataSource.getUserRewards();
       List<RewardModel> rewardsModel =response
          .map((e) => RewardModel.fromJson(e)).toList();
      return right(rewardsModel.map((e) => e.toDomain()).toList());
    }catch(e){
      return left(const ErrorModel(error: Error(message: 'Network Error')));
    }
  }

}