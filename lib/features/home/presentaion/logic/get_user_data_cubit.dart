import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/core/base/domain/usecases/usecase.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';
import 'package:steps_tracker/features/home/domain/usecases/get_user_data_use_case.dart';

class GetUserDataCubit extends Cubit<BaseState<UserEntity>> {

  GetUserDataUseCase getUserDataUseCase;

  GetUserDataCubit({
    required this.getUserDataUseCase,
  }) : super(const BaseState());


  getUserData()async{
    emit(state.setInProgressState());

    Either<ErrorModel,UserEntity> data =await getUserDataUseCase.call(NoParams());

    emit(data.fold((l) => state.setFailureState(l),
            (r) => state.setSuccessState(r)));
  }



}
