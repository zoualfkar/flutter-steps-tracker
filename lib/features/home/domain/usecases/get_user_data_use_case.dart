import 'package:dartz/dartz.dart';
import 'package:steps_tracker/core/base/domain/usecases/usecase.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';
import 'package:steps_tracker/features/home/domain/repositories/home_repository.dart';

class GetUserDataUseCase  extends UseCase<UserEntity, NoParams> {

  HomeRepository repository;

  GetUserDataUseCase({
    required this.repository
  });

  @override
  Future<Either<ErrorModel,UserEntity>> call(params) {
    return repository.getUserData();
  }
}
