import 'package:dartz/dartz.dart';
import 'package:steps_tracker/core/base/domain/usecases/usecase.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/core/common/data/models/success_model/success_model.dart';
import 'package:steps_tracker/features/home/domain/repositories/home_repository.dart';

class SaveUserDataUseCase  extends UseCase<SuccessModel, SaveUserDataUseCaseParams> {

  HomeRepository repository;

  SaveUserDataUseCase({
    required this.repository
  });

  @override
  Future<Either<ErrorModel,SuccessModel>> call(SaveUserDataUseCaseParams params) {
    return repository.saveUserData(
        count: params.count,
        totalCount: params.totalCount,
        healthPoint: params.healthPoint
    );
  }
}


class SaveUserDataUseCaseParams {
  final int count;
  final int totalCount;
  final int healthPoint;

  SaveUserDataUseCaseParams({
    required this.count,
    required this.totalCount,
    required this.healthPoint,
  });
}

