import 'package:dartz/dartz.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/core/common/data/models/success_model/success_model.dart';

abstract class AuthRepository{

  Future<Either<ErrorModel,SuccessModel>> login({
    required String name
 });
}