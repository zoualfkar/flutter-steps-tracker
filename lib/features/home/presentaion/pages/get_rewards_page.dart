import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/core/base/presentation/screen_utils.dart';
import 'package:steps_tracker/core/common/widget/app_bar_widget.dart';
import 'package:steps_tracker/core/common/widget/loading_view.dart';
import 'package:steps_tracker/core/utils/managers/tracker_manger/tracker_manger.dart';
import 'package:steps_tracker/features/home/domain/entities/reward_entity.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';
import 'package:steps_tracker/features/home/presentaion/logic/get_reward_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/logic/get_user_data_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/logic/save_user_data_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/pages/widget/select_user_dialog.dart';
import 'package:steps_tracker/injections.dart';

class RewardPage extends StatefulWidget  {
  const RewardPage({Key? key}) : super(key: key);

  @override
  State<RewardPage> createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> with ScreenUtils {

  GetRewardCubit getRewardCubit =serviceLocator<GetRewardCubit>();
  SaveUserDataCubit saveUserDataCubit =serviceLocator<SaveUserDataCubit>();

  UserEntity? user =serviceLocator<TrackManger>().userEntity;


  @override
  void initState() {
    super.initState();

    if(user==null){
      showError(customMessage: 'please wait to loading user data');
      context.router.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'reward_page'.tr(),),
      body: BlocConsumer<GetRewardCubit,BaseState>(
        bloc: getRewardCubit,
        listener: (context, state) {
          if(state.isSuccess){
            showSuccess(customMessage: 'success get reward');
           var trackManger= serviceLocator<TrackManger>();

           var rewardId =state.item!;
           var reward=rewards.firstWhere((element) => element.id==rewardId);
            trackManger.userEntity!.healthPoint-=reward.points;


            /// save user data after change health point
            saveUserDataCubit.saveUserData
              (count:  trackManger.userEntity!.count,
                totalCount:  trackManger.userEntity!.totalCount,
                healthPoint:  trackManger.userEntity!.healthPoint);

            /// refresh home page
            serviceLocator<GetUserDataCubit>().getUserData();

        }
        },
        builder: (context, state) {

          if(state.isInProgress){
            return const LoadingView();
          }

        return  ListView.builder(
              itemCount: rewards.length,
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: (){
                      if(user!.healthPoint < rewards[index].points){
                        showError(customMessage: "you_don't_have_enough_health_points".tr());
                      }else{
                        openBankDialog(rewards[index].id);
                      }
                    },
                    leading: CircleAvatar(

                      backgroundImage: AssetImage(
                        rewards[index].image,

                      ),
                    ),
                    title: Text(
                      rewards[index].title,
                      style:  Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Text(
                      '${'points'.tr()}: ${rewards[index].points} ',
                      style:  Theme.of(context).textTheme.subtitle1,
                    ),

                  ),
                );
              });
        },
      ),
    );
  }


  openBankDialog(int rewardId) {
    showDialog(
        barrierColor: Colors.black.withOpacity(0.6),
        context: context,
        barrierDismissible: true,
        builder: (BuildContext ctx) {
          return SelectUserDialog(onSelect: (user){
            getRewardCubit.getReward(partnerId: user.id, rewardId: rewardId);
          });
        });
  }


  List<RewardEntity> rewards=[
    RewardEntity(
      id: 1,
      image: 'assets/images/watch.png',
      title: 'digital_watch'.tr(),
      points: 2
    ),
    RewardEntity(
        id: 2,
        image: 'assets/images/coffee.png',
        title: 'free_coffee'.tr(),
        points: 1),
  ];

}
