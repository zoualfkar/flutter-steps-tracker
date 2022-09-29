import 'package:dartz/dartz.dart';
import 'package:steps_tracker/core/base/domain/usecases/usecase.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/features/home/domain/entities/exchange_history_entity.dart';
import 'package:steps_tracker/features/home/domain/repositories/home_repository.dart';

class GetExchangeHistoryUseCase  extends UseCase<List<ExchangeHistoryEntity>, NoParams> {

  HomeRepository repository;

  GetExchangeHistoryUseCase({
    required this.repository
  });

  @override
  Future<Either<ErrorModel,List<ExchangeHistoryEntity>>> call(NoParams params) {
    return repository.getExchangeHistory();
  }
}
