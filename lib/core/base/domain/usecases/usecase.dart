
import 'package:dartz/dartz.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ErrorModel, Type>> call(Params params);
}

class NoParams {}
