import 'package:dartz/dartz.dart';
import 'package:steps_tracker/core/base/domain/usecases/usecase.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/core/common/data/models/success_model/success_model.dart';
import 'package:steps_tracker/features/home/domain/repositories/home_repository.dart';

class AddExchangeHistoryUseCase  extends UseCase<SuccessModel, AddExchangeHistoryUseCaseParams> {

  HomeRepository repository;

  AddExchangeHistoryUseCase({
    required this.repository
  });

  @override
  Future<Either<ErrorModel,SuccessModel>> call(AddExchangeHistoryUseCaseParams params) {
    return repository.addExchangeToHistory(
        count: params.count,
        date: params.date,
    );
  }
}


class AddExchangeHistoryUseCaseParams {
  final int count;
  final String date;

  AddExchangeHistoryUseCaseParams({
    required this.count,
    required this.date,
  });
}

