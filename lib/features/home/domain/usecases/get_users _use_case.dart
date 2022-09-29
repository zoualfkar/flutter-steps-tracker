import 'package:dartz/dartz.dart';
import 'package:steps_tracker/core/base/domain/usecases/usecase.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';
import 'package:steps_tracker/features/home/domain/repositories/home_repository.dart';

class GetUsersUseCase  extends UseCase<List<UserEntity>, NoParams>{


  HomeRepository repository;

  GetUsersUseCase({
    required this.repository
  });

  @override
  Future<Either<ErrorModel,List<UserEntity>>> call(NoParams params) {
    return repository.getUsers();
  }

}