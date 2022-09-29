import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/app/logic/app_settings.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/core/base/presentation/screen_utils.dart';
import 'package:steps_tracker/core/common/widget/button_view.dart';
import 'package:steps_tracker/core/common/widget/error_view.dart';
import 'package:steps_tracker/core/common/widget/loading_view.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';
import 'package:steps_tracker/features/home/presentaion/logic/get_users_cubit.dart';
import 'package:steps_tracker/features/home/presentaion/pages/widget/drop_down_button_view.dart';
import 'package:steps_tracker/injections.dart';

class SelectUserDialog extends StatefulWidget {

  final Function(UserEntity) onSelect;

  const SelectUserDialog({
    required this.onSelect,
    Key? key}) : super(key: key);

  @override
  State<SelectUserDialog> createState() => _SelectUserDialogState();
}

class _SelectUserDialogState extends State<SelectUserDialog> with ScreenUtils{

  GetUsersCubit getUsersCubit=serviceLocator<GetUsersCubit>();
  String loggedInUserId= serviceLocator<AppSettings>().userId??'';
  UserEntity? selectedUserEntity;

  @override
  void initState() {
    super.initState();
    getUsersCubit.getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: SizedBox(
        width: MediaQuery.of(context).size.width,
    height: 250,
    child:BlocConsumer<GetUsersCubit,BaseState<List<UserEntity>>>(
      bloc:getUsersCubit,
      listener: (context, state) {
       if(state.isSuccess){

         state.item!.removeWhere((element) => element.id==loggedInUserId);
         selectedUserEntity=  state.item!.isNotEmpty ?  state.item![0]:null;

       setState(() {});
       }
      },
      builder: (context, state) {

        if(state.isInProgress) {
          return const  LoadingView();
        } else if(state .isFailure){
          return ErrorView(error: state.failure?.error?.message??'',
              onRefresh: (){
                getUsersCubit.getUsers();
              });
        }


        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            DropdownButtonView(
              title: 'select_partner'
                  .tr(),
              dropdownValues: state.item!,
              selected: selectedUserEntity,
              onChanged: (value) {
                selectedUserEntity = value;
                setState(() {});
              },
            ),

            SizedBox(width: 350,
                height: 55,
                child: ButtonView(
                  buttonType: ButtonType.soldButton,
                  buttonStyle: roundedButtonStyle(),
                  title: 'select_partner'.tr(),
                  onPressed: (){

                    if(selectedUserEntity==null){
                      showError(customMessage: 'select user');
                    }else{
                      widget.onSelect(selectedUserEntity!);
                      context.router.pop();
                    }


                  },))
          ],
        );


      },
    )));
  }
}
