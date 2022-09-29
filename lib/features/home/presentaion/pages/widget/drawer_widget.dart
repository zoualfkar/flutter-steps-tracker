import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:steps_tracker/app/logic/app_bloc.dart';
import 'package:steps_tracker/app/logic/app_settings.dart';
import 'package:steps_tracker/app/routes/router.dart';
import 'package:steps_tracker/injections.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  late bool isSwitch;

  @override
  void initState() {
    super.initState();
    var currentTheme=serviceLocator<AppSettings>().themeID;
    isSwitch= currentTheme==1;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [

          UserAccountsDrawerHeader(
              accountName: Text('app_name'.tr(),
              style: Theme.of(context).textTheme.headline2,
              ),
            accountEmail:const  SizedBox.shrink(),
             ),
          Card(
            elevation: 20,
            child:  ListTile(
              onTap: (){
                context.router.push(const ExchangeHistoryRoute());
                Scaffold.of(context).closeDrawer();
              },
              leading: const Icon(
                Icons.reorder,
              ),
              title:  Text('exchange_history'.tr()),
            ),
          ),

          Card(
            elevation: 20,
            child:  ListTile(
              onTap: (){
                context.router.push(const RewardRoute());
                Scaffold.of(context).closeDrawer();
              },
              leading: const Icon(
                Icons.reorder,
              ),
              title:  Text('get_rewards'.tr()),
            ),
          ),


          Card(
            elevation: 20,
            child:  ListTile(
              onTap: (){
                context.router.push(const MyRewardRoute());
                Scaffold.of(context).closeDrawer();
              },
              leading: const Icon(
                Icons.reorder,
              ),
              title:  Text('my_rewards'.tr()),
            ),
          ),



          Card(
            elevation: 20,
            child:  ListTile(
              onTap: (){
                context.router.push(const RankingRoute());
                Scaffold.of(context).closeDrawer();
              },
              leading: const Icon(
                Icons.reorder,
              ),
              title:  Text('ranking'.tr()),
            ),
          ),


          Card(
            elevation: 20,
            child:  ListTile(
              onTap: (){
                changeTheme();

              },
              leading: const Icon(
                Icons.reorder,
              ),
              title:  Text('dark_mode'.tr()),
              trailing:Switch(
                onChanged: (value){
                  changeTheme();
                },
                value: isSwitch,
              ) ,
            ),
          ),


          Card(
            elevation: 20,
            child:  ListTile(
              onTap: (){
                serviceLocator<AppSettings>().userId=null;
                context.router.replace(const LoginRoute());
              },
              leading: const Icon(
                Icons.reorder,
              ),
              title:  Text('logout'.tr()),
            ),
          ),




        ],
      ),
    );
  }

  changeTheme(){
    isSwitch=!isSwitch;
    setState(() {});
    var currentTheme=serviceLocator<AppSettings>().themeID;

    serviceLocator<AppSettings>().themeID=currentTheme==1?2:1;
    serviceLocator<AppBloc>().refreshApp();
    Scaffold.of(context).closeDrawer();
  }
}
