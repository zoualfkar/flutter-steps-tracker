
import 'package:dartz/dartz.dart';
import 'package:steps_tracker/app/logic/app_settings.dart';
import 'package:steps_tracker/core/common/data/models/error_model/error_model.dart';
import 'package:steps_tracker/core/common/data/models/success_model/success_model.dart';
import 'package:steps_tracker/features/auth/domain/repository/auth_repository.dart';
import 'package:steps_tracker/features/auth/data/data_source/remote/auth_data_source.dart';
import 'package:steps_tracker/injections.dart';

class AuthRepositoryImpl extends AuthRepository{

  AuthDataSource dataSource;

  AuthRepositoryImpl({
    required this.dataSource,
 });

  @override
  Future<Either<ErrorModel, SuccessModel>> login({required String name}) async{
   try{

   var response =  await dataSource.login(name);

   if(response.docs.isEmpty){
    var response= await  dataSource.addUser(name);
      serviceLocator<AppSettings>().userId= response.id;
   }else{
     serviceLocator<AppSettings>().userId= response.docs[0].id;
   }

     return right(const SuccessModel());
   }catch(e){
     return left(const ErrorModel(error: Error(message: 'Network Error')));
   }
  }

}