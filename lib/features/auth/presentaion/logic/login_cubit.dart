import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/core/common/data/models/success_model/success_model.dart';
import 'package:steps_tracker/features/auth/domain/usecases/login_use_case.dart';


class LoginCubit extends Cubit<BaseState<SuccessModel>> {

  LoginUseCase loginUseCase;

  LoginCubit({
    required this.loginUseCase,
}) : super(const BaseState());


  login(String name) async{
    emit(state.setInProgressState());

    Either<ErrorModel,SuccessModel> data =await loginUseCase.call(
        LoginUseCaseParams(name: name));

    emit(data.fold((l) => state.setFailureState(l),
            (r) => state.setSuccessState(r)));
  }
}
