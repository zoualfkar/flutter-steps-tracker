import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/app/logic/app_settings.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/core/base/presentation/screen_utils.dart';
import 'package:steps_tracker/core/common/widget/app_bar_widget.dart';
import 'package:steps_tracker/core/common/widget/error_view.dart';
import 'package:steps_tracker/core/common/widget/loading_view.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';
import 'package:steps_tracker/features/home/presentaion/logic/get_users_cubit.dart';
import 'package:steps_tracker/injections.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingState();
}

class _RankingState extends State<RankingPage> with ScreenUtils {


  GetUsersCubit getUsersCubit = serviceLocator<GetUsersCubit>();

  String userId=serviceLocator<AppSettings>().userId??'';



  @override
  void initState() {
    super.initState();


    getUsersCubit.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'ranking'.tr(),),
      body: BlocBuilder<GetUsersCubit,BaseState<List<UserEntity>>>(
        bloc:getUsersCubit,
        builder: (context, state) {

          if(state.isInProgress) {
            return const  LoadingView();
          } else if(state .isFailure){
            return ErrorView(error: state.failure?.error?.message??'',
                onRefresh: (){
                  getUsersCubit.getUsers();
                });
          }

          sortList(state.item!);


          return ListView.builder(
              itemCount: state.item!.length,
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              itemBuilder: (context, index) {
                return Card(
                  color:state.item![index].id==userId ? Theme.of(context).colorScheme.primary:null,
                  child: ListTile(
                    title: Text(
                      '${state.item![index].name} ',
                      style:  Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle:Text(
                      '${'steps'.tr()}: ${state.item![index].totalCount}  ',
                      style:  Theme.of(context).textTheme.subtitle2,
                    ) ,
                  ),
                );
              });
        },
      ),
    );
  }


  sortList(List<UserEntity> list){
      var length=list.length;
      int out, inside;
      for (out = length - 1; out >= 1; out--) {
        for (inside = 0; inside < out; inside++) {
          if (list[inside].totalCount < list[inside + 1].totalCount) {
            var temp = list[inside];
            list[inside] = list[inside + 1];
            list[inside + 1] = temp;
          }
        }
      }

  }
}
