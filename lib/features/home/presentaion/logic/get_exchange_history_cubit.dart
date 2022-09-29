import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/core/base/domain/usecases/usecase.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/features/home/domain/entities/exchange_history_entity.dart';
import 'package:steps_tracker/features/home/domain/usecases/get_exchange_history_use_case.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';



class GetExchangeHistoryCubit extends Cubit<BaseState<List<ExchangeHistoryEntity>>> {

  GetExchangeHistoryUseCase getExchangeHistoryUseCase;

  GetExchangeHistoryCubit({
    required this.getExchangeHistoryUseCase,
}) : super(const BaseState(item: []));


  getExchangeHistory()async{
    emit(state.setInProgressState());

    Either<ErrorModel,List<ExchangeHistoryEntity>> data =
    await getExchangeHistoryUseCase.call(NoParams());

    emit(data.fold((l) => state.setFailureState(l),
            (r) => state.setSuccessState(r)));
  }
}
