import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/features/home/domain/usecases/save_user_data.dart';


class SaveUserDataCubit extends Cubit<BaseState> {

  SaveUserDataUseCase saveUserDataUseCase;

  SaveUserDataCubit({
    required this.saveUserDataUseCase,
}) : super(const BaseState());

  saveUserData({
    required int count,
    required int totalCount,
    required int healthPoint,
  }) async{

    emit(state.setInProgressState());

    var data =await saveUserDataUseCase.call(
        SaveUserDataUseCaseParams(
            count: count, totalCount: totalCount, healthPoint: healthPoint));

    emit(data.fold((l) => state.setFailureState(l),
            (r) => state.setSuccessState(r)));

  }
}
