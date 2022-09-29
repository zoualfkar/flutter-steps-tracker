import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/features/home/domain/usecases/add_to_history_use_case.dart';


class AddToHistoryCubit extends Cubit<BaseState> {

  AddExchangeHistoryUseCase addExchangeHistoryUseCase;

  AddToHistoryCubit({
    required this.addExchangeHistoryUseCase,
}) : super(const BaseState());


  addExchangeToHistory({
    required int count,
    required String date,
 })async{

    emit(state.setInProgressState());

    var data =await addExchangeHistoryUseCase.call(
        AddExchangeHistoryUseCaseParams(
            count: count, date: date,
        ));

    emit(data.fold((l) => state.setFailureState(l),
            (r) => state.setSuccessState(r)));

  }

}
