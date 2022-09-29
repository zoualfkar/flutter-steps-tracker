import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_tracker/app/routes/router.dart';
import 'package:steps_tracker/core/base/presentation/base_state.dart';
import 'package:steps_tracker/core/common/data/models/success_model/success_model.dart';
import 'package:steps_tracker/core/common/widget/app_bar_widget.dart';
import 'package:steps_tracker/core/common/widget/button_view.dart';
import 'package:steps_tracker/core/common/widget/loading_view.dart';
import 'package:steps_tracker/core/common/widget/text_form_field_view.dart';
import 'package:steps_tracker/features/auth/presentaion/logic/login_cubit.dart';
import 'package:steps_tracker/injections.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  AutovalidateMode? autoValidateMode;


  TextEditingController textEditingController= TextEditingController();

  LoginCubit loginCubit = serviceLocator<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        showIcon: false,
        title: 'login'.tr(),
      ),
      body: BlocConsumer<LoginCubit,BaseState<SuccessModel>>(
        bloc: loginCubit,
        listener: (context, state) {
          if(state.isSuccess){
            context.router.replace(const HomeRoute());
          }else if(state.isFailure){
            var snackBar =  SnackBar(content: Text(state.failure?.error?.message??''));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if(state.isInProgress) {
            return const  LoadingView();
          } else {
          return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formGlobalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    TextFormFieldView(
                      textEditingController: textEditingController,
                      textFormFieldTypes: TextFormFieldTypes.text,
                      autovalidateMode: autoValidateMode,
                      minLength: 3,
                      maxLength: 15,
                      errorMessage: 'field_required'.tr(),
                      title: 'user_name'.tr(),
                    ),

                    const SizedBox(height: 40,),
                    SizedBox(
                      width: 350,
                      height: 55,
                      child: ButtonView(
                        buttonType: ButtonType.soldButton,
                        buttonStyle: roundedButtonStyle(),
                        title: 'login'.tr(),
                        onPressed: () {

                          if (formGlobalKey.currentState?.validate() ?? false) {
                            loginCubit.login(textEditingController.text);
                          } else {
                            setState(() {
                              autoValidateMode =
                                  AutovalidateMode.onUserInteraction;
                            });
                          }



                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
