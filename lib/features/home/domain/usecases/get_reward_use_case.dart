
import 'package:dartz/dartz.dart';
import 'package:steps_tracker/core/base/domain/usecases/usecase.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/core/common/data/models/success_model/success_model.dart';
import 'package:steps_tracker/features/home/domain/repositories/home_repository.dart';

class GetRewardUseCase  extends UseCase<SuccessModel, GetRewardUseCaseParams> {

  HomeRepository repository;

  GetRewardUseCase({
    required this.repository
  });

  @override
  Future<Either<ErrorModel,SuccessModel>> call(GetRewardUseCaseParams params) {
    return repository.getReward(
      partnerId: params.partnerId,
      rewardId: params.rewardId,
    );
  }
}


class GetRewardUseCaseParams {
  final String partnerId;
  final int rewardId;

  GetRewardUseCaseParams({
    required this.partnerId,
    required this.rewardId,
  });
}