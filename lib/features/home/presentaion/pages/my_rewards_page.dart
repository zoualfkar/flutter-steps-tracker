import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/core/common/widget/app_bar_widget.dart';
import 'package:steps_tracker/core/common/widget/error_view.dart';
import 'package:steps_tracker/core/common/widget/loading_view.dart';
import 'package:steps_tracker/features/home/presentaion/logic/get_user_reward_cubit.dart';
import 'package:steps_tracker/injections.dart';
import 'package:steps_tracker/features/home/domain/entities/reward_entity.dart';

class MyRewardPage extends StatefulWidget {
  const MyRewardPage({Key? key}) : super(key: key);

  @override
  State<MyRewardPage> createState() => _MyRewardPageState();
}

class _MyRewardPageState extends State<MyRewardPage> {


  GetUserRewardCubit getUserRewardCubit = serviceLocator<GetUserRewardCubit>();


  @override
  void initState() {
    super.initState();
    getUserRewardCubit.getUserRewards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'my_rewards'.tr(),),
      body: BlocBuilder<GetUserRewardCubit,BaseState>(
        bloc: getUserRewardCubit,
        builder: (context, state) {

          if(state.isInProgress) {
            return const  LoadingView();
          } else if(state .isFailure){
            return ErrorView(error: state.failure?.error?.message??'',
                onRefresh: (){
                  getUserRewardCubit.getUserRewards();
                });
          }

          return ListView.builder(
              itemCount: state.item!.length,
              itemBuilder: (context, index) {

                var reward =rewards.firstWhere((element) => element.id==state.item![index].id);
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(

                      backgroundImage: AssetImage(
                        reward.image,

                      ),
                    ),
                    title: Text(
                      reward.title,
                      style:  Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${'points'.tr()}: ${reward.points} ',
                          style:  Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          '${'partner'.tr()}: ${state.item![index].partner.name} ',
                          style:  Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),

                  ),
                );

          });
        },),
    );
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
