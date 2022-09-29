import 'package:dartz/dartz.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/core/common/data/models/success_model/success_model.dart';
import 'package:steps_tracker/features/auth/domain/repository/auth_repository.dart';
import 'package:steps_tracker/core/base/domain/usecases/usecase.dart';

class LoginUseCase  extends UseCase<SuccessModel, LoginUseCaseParams> {

  AuthRepository repository;

  LoginUseCase({
    required this.repository
});

  @override
  Future<Either<ErrorModel,SuccessModel>> call(LoginUseCaseParams params) {
    return repository.login(
      name: params.name
    );
  }
}


class LoginUseCaseParams {
  final String name;

  LoginUseCaseParams({required this.name});
}
