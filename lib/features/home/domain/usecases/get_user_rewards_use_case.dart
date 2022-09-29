import 'package:dartz/dartz.dart';
import 'package:steps_tracker/core/base/domain/usecases/usecase.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/features/home/domain/entities/my_reward_entity.dart';
import 'package:steps_tracker/features/home/domain/repositories/home_repository.dart';

class GetUserRewardUseCase  extends UseCase<List<MyRewardEntity>, NoParams> {

  HomeRepository repository;

  GetUserRewardUseCase({
    required this.repository
  });

  @override
  Future<Either<ErrorModel,List<MyRewardEntity>>> call(params) {
    return repository.getUserReward();
  }
}
