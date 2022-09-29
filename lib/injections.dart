import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:steps_tracker/core/utils/managers/notification_manger/local_notification_manger.dart';
import 'package:steps_tracker/core/utils/managers/tracker_manger/tracker_manger.dart';
import 'package:steps_tracker/features/auth/data/data_source/remote/auth_data_source.dart';
import 'package:steps_tracker/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:steps_tracker/features/auth/domain/repository/auth_repository.dart';
import 'package:steps_tracker/features/auth/domain/usecases/login_use_case.dart';
import 'package:steps_tracker/features/auth/presentaion/logic/login_cubit.dart';
import 'package:steps_tracker/features/home/data/data_source/remote/home_datasource.dart';
import 'package:steps_tracker/features/home/data/repositories/home_repository.dart';
import 'package:steps_tracker/features/home/domain/repositories/home_repository.dart';
import 'package:steps_tracker/features/home/domain/usecases/add_to_history_use_case.dart';
import 'package:steps_tracker/features/home/domain/usecases/get_exchange_history_use_case.dart';
import 'package:steps_tracker/features/home/domain/usecases/get_reward_use_case.dart';
import 'package:steps_tracker/features/home/domain/usecases/get_user_data_use_case.dart';
import 'package:steps_tracker/features/home/domain/usecases/get_user_rewards_use_case.dart';
import 'package:steps_tracker/features/home/domain/usecases/get_users%20_use_case.dart';
import 'package:steps_tracker/features/home/domain/usecases/save_user_data.dart';
import 'package:steps_tracker/features/home/presentaion/logic/add_to_history_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/logic/get_exchange_history_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/logic/get_reward_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/logic/get_user_data_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/logic/get_user_reward_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/logic/get_users_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/logic/save_user_data_cubit.dart';
import 'app/logic/app_bloc.dart';
import 'app/logic/app_settings.dart';
import 'app/routes/router.dart';
import 'core/utils/managers/database/database_manager.dart';
import 'core/utils/managers/fore_ground_service/fore_ground_service.dart';
import 'core/utils/managers/graphql/graphql_manger.dart';
import 'core/utils/managers/http/domain_lookup.dart';
import 'core/utils/managers/http/http_manager.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  initInjections(serviceLocator);
  serviceLocator.allowReassignment = true;
}

void initInjections(GetIt serviceLocator) {


  //! Utls
  serviceLocator.registerLazySingleton<DomainLookup>(
        () => DomainLookupImpl(),
  );

  serviceLocator.registerLazySingleton<AppSettings>(
        () => AppSettings(databaseManager: serviceLocator()),
  );


  //! App

  //* Logic
  serviceLocator.registerLazySingleton<AppBloc>(
        () => AppBloc(domainLookup: serviceLocator()),
  );

  //* Router
  serviceLocator.registerLazySingleton<AppRouter>(
        () => AppRouter(),
  );

  //! core

  //* Database
  serviceLocator.registerLazySingleton<DatabaseManager>(
        () => DatabaseManagerImpl(),
  );

  //* Network
  serviceLocator.registerLazySingleton<BaseOptions>(
        () =>
        BaseOptions(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            "charset": "utf-8",
            "Accept-Charset": "utf-8",
          },
          responseType: ResponseType.plain,
        ),
  );

  serviceLocator.registerLazySingleton<HttpManager>(
        () =>
        HttpManagerImpl(
          baseOptions: serviceLocator(),
          databaseManager: serviceLocator(),
        ),
  );

  serviceLocator.registerLazySingleton<GraphQlManger>(
        () => GraphQlManger(),
  );


  serviceLocator.registerLazySingleton<ForeGroundService>(
        () => ForeGroundService(),
  );

  serviceLocator.registerLazySingleton<LocalNotificationManger>(
        () => LocalNotificationManger(),
  );

  serviceLocator.registerLazySingleton<TrackManger>(
        () => TrackManger(),
  );

  /// auth feature

  // data source
  serviceLocator.registerFactory<AuthDataSource>(
        () => AuthDataSourceImpl(),
  );

  // repository
  serviceLocator.registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(dataSource: serviceLocator()),
  );

  // user case
  serviceLocator.registerFactory<LoginUseCase>(
        () => LoginUseCase(repository: serviceLocator()),
  );

  // bloc
  serviceLocator.registerFactory<LoginCubit>(
        () => LoginCubit(loginUseCase: serviceLocator()),
  );


  /// home feature

  // data source
  serviceLocator.registerFactory<HomeDataSource>(
        () => HomeDataSourceImpl(),
  );

  // repository
  serviceLocator.registerFactory<HomeRepository>(
        () => HomeRepositoryImpl(dataSource: serviceLocator()),
  );



  // user case
  serviceLocator.registerFactory<GetUserDataUseCase>(
        () => GetUserDataUseCase(repository: serviceLocator()),
  );

  serviceLocator.registerFactory<SaveUserDataUseCase>(
        () => SaveUserDataUseCase(repository: serviceLocator()),
  );

  serviceLocator.registerFactory<AddExchangeHistoryUseCase>(
        () => AddExchangeHistoryUseCase(repository: serviceLocator()),
  );

  serviceLocator.registerFactory<GetExchangeHistoryUseCase>(
        () => GetExchangeHistoryUseCase(repository: serviceLocator()),
  );

  serviceLocator.registerFactory<GetUsersUseCase>(
        () => GetUsersUseCase(repository: serviceLocator()),
  );

  serviceLocator.registerFactory<GetRewardUseCase>(
        () => GetRewardUseCase(repository: serviceLocator()),
  );

  serviceLocator.registerFactory<GetUserRewardUseCase>(
        () => GetUserRewardUseCase(repository: serviceLocator()),
  );

  // bloc
  serviceLocator.registerLazySingleton<GetUserDataCubit>(
        () => GetUserDataCubit(getUserDataUseCase: serviceLocator()),
  );

  serviceLocator.registerFactory<SaveUserDataCubit>(
        () => SaveUserDataCubit(saveUserDataUseCase: serviceLocator()),
  );

  serviceLocator.registerFactory<AddToHistoryCubit>(
        () => AddToHistoryCubit(addExchangeHistoryUseCase: serviceLocator()),
  );


  serviceLocator.registerFactory<GetExchangeHistoryCubit>(
        () => GetExchangeHistoryCubit(getExchangeHistoryUseCase: serviceLocator()),
  );


  serviceLocator.registerFactory<GetUsersCubit>(
        () => GetUsersCubit(getUsersUseCase: serviceLocator()),
  );

  serviceLocator.registerFactory<GetRewardCubit>(
        () => GetRewardCubit(getRewardUseCase: serviceLocator()),
  );

  serviceLocator.registerFactory<GetUserRewardCubit>(
        () => GetUserRewardCubit(getUserRewardUseCase: serviceLocator()),
  );

}