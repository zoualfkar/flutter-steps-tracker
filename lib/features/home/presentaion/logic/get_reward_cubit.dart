import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/core/common/data/models/success_model/success_model.dart';
import 'package:steps_tracker/features/home/domain/usecases/get_reward_use_case.dart';


class GetRewardCubit extends Cubit<BaseState<int>> {

  GetRewardUseCase getRewardUseCase;

  GetRewardCubit({
    required this.getRewardUseCase,
}) : super(const BaseState());

  getReward({
    required String partnerId,
    required int rewardId
})async{

    emit(state.setInProgressState());

    Either<ErrorModel,SuccessModel> data =await getRewardUseCase.call(
      GetRewardUseCaseParams(partnerId: partnerId, rewardId: rewardId));

    emit(data.fold((l) => state.setFailureState(l),
            (r) {
            return  state.setSuccessState(rewardId);
            }));



  }
}
