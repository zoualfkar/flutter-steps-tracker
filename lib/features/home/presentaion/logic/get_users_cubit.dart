import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/core/base/domain/usecases/usecase.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';
import 'package:steps_tracker/features/home/domain/usecases/get_users%20_use_case.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';


class GetUsersCubit extends Cubit<BaseState<List<UserEntity>>> {

  GetUsersUseCase getUsersUseCase;

  GetUsersCubit({
    required this.getUsersUseCase,
}) : super(const BaseState());

  getUsers()async{
    emit(state.setInProgressState());

    Either<ErrorModel,List<UserEntity>> data =
        await getUsersUseCase.call(NoParams());

    emit(data.fold((l) => state.setFailureState(l),
            (r) => state.setSuccessState(r)));
  }
}
