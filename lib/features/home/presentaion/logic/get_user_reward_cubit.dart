import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/core/base/domain/usecases/usecase.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/features/home/domain/entities/my_reward_entity.dart';
import 'package:steps_tracker/features/home/domain/usecases/get_user_rewards_use_case.dart';


class GetUserRewardCubit extends Cubit<BaseState<List<MyRewardEntity>>> {

  GetUserRewardUseCase getUserRewardUseCase;

  GetUserRewardCubit({
    required this.getUserRewardUseCase,
}) : super(const BaseState<List<MyRewardEntity>>(item: []));


  getUserRewards()async{
    emit(state.setInProgressState());

    Either<ErrorModel,List<MyRewardEntity>> data =await getUserRewardUseCase.call(NoParams());

    emit(data.fold((l) => state.setFailureState(l),
            (r) => state.setSuccessState(r)));
  }
}
