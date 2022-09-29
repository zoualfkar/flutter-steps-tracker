import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_foreground_task/ui/with_foreground_task.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/core/base/presentation/screen_utils.dart';
import 'package:steps_tracker/core/common/widget/app_bar_widget.dart';
import 'package:steps_tracker/core/common/widget/error_view.dart';
import 'package:steps_tracker/core/utils/managers/fore_ground_service/fore_ground_service.dart';
import 'package:steps_tracker/core/utils/managers/notification_manger/local_notification_manger.dart';
import 'package:steps_tracker/core/utils/managers/tracker_manger/tracker_manger.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';
import 'package:steps_tracker/features/home/presentaion/logic/add_to_history_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/logic/get_user_data_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/logic/save_user_data_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/pages/widget/drawer_widget.dart';
import 'package:steps_tracker/injections.dart';
import 'package:steps_tracker/core/common/widget/loading_view.dart';

class HomePage extends StatefulWidget  {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with ScreenUtils, WidgetsBindingObserver{

  TrackManger trackManger=serviceLocator<TrackManger>();
  StreamSubscription? streamSubscription;

  GetUserDataCubit getUserDataCubit =serviceLocator<GetUserDataCubit>();
  SaveUserDataCubit saveUserDataCubit =serviceLocator<SaveUserDataCubit>();
  AddToHistoryCubit addToHistoryCubit =serviceLocator<AddToHistoryCubit>();

  bool _isInForeground = false;



  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    getUserDataCubit.getUserData();
  }



  /// listen to tracker
  listen() async{
    streamSubscription= await trackManger.listen((event){

      trackManger.localStep =event.steps;

      var count= (trackManger.localStep - trackManger.userEntity!.totalCount);

      if(count<0) count=event.steps;// this line for remove app and install again
      trackManger.userEntity!.count+=count;

      trackManger.userEntity!.totalCount= trackManger.localStep;

      /// calculate health point
      int newHealthPoint= trackManger.userEntity!.count ~/ 100;
      trackManger.userEntity!.healthPoint+=newHealthPoint;
      trackManger.userEntity!.count -=newHealthPoint*100;

      /// save user data
      saveUserDataCubit.saveUserData
        (count:  trackManger.userEntity!.count,
          totalCount:  trackManger.userEntity!.totalCount,
          healthPoint:  trackManger.userEntity!.healthPoint);

      if(newHealthPoint>0){

        addToHistoryCubit.addExchangeToHistory(
            count: newHealthPoint,
            date: DateTime.now().toString());

        if(_isInForeground){
          /// app in background show notification
          serviceLocator<LocalNotificationManger>().showNotification();
        }else{
          ///app in foreground show snack bar
          showSuccess(customMessage: 'got_new_health_point'.tr(),);
        }
      }
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return WithForegroundTask(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBarWidget(
          showIcon: false,
          title: 'app_name'.tr(),),
        body: BlocConsumer<GetUserDataCubit,BaseState<UserEntity>>(
          bloc: getUserDataCubit,
          listener: (context, state) {
            if(state.isSuccess){
              trackManger.userEntity=state.item;
              if(streamSubscription!=null) streamSubscription!.cancel();
              listen();
              setState(() {});
              /// start for ground service
              serviceLocator<ForeGroundService>().startForegroundTask();
            }
          },
          builder: (context, state) {
            if(state.isInProgress) {
              return const  LoadingView();
            } else if(state .isFailure){
              return ErrorView(error: state.failure?.error?.message??'',
                  onRefresh: (){
                    getUserDataCubit.getUserData();
                  });
            }

            return SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const SizedBox(height: 20,),

                    SizedBox(
                      width: 300,
                      child: Card(
                        child: Column(
                          children: [
                            Text('steps_count'.tr(),
                              style:  Theme.of(context).textTheme.headline2,),
                            const SizedBox(height: 5,),

                            Text('${trackManger.userEntity?.count??0}',
                              style:  Theme.of(context).textTheme.headline2,),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),



                    SizedBox(
                      width: 300,
                      child: Card(
                        child: Column(
                          children: [
                            Text('health_points'.tr(),
                              style:  Theme.of(context).textTheme.headline2,),
                            const SizedBox(height: 5,),
                            Text('${trackManger.userEntity?.healthPoint??0}',
                              style:  Theme.of(context).textTheme.headline2,),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),



                    SizedBox(
                      width: 300,
                      child: Card(
                        child: Column(
                          children: [
                            Text('total_steps'.tr(),
                              style:  Theme.of(context).textTheme.headline2,),
                            const SizedBox(height: 5,),
                            Text('${trackManger.userEntity?.totalCount??0}',
                              style:  Theme.of(context).textTheme.headline2,),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );

  }



  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        {_isInForeground=false;}
        break;
      case AppLifecycleState.inactive:
        {}
        break;
      case AppLifecycleState.paused:
        {
          _isInForeground=true;
        }
        break;
      case AppLifecycleState.detached:
        {}
        break;
    }
  }


  @override
  void dispose() {
    if(streamSubscription!=null) streamSubscription!.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
