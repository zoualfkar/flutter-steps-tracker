import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:steps_tracker/app/logic/app_bloc.dart';
import 'package:steps_tracker/core/utils/managers/graphql/graphql_manger.dart';
import 'package:steps_tracker/core/utils/managers/notification_manger/local_notification_manger.dart';
import 'package:steps_tracker/injections.dart';
import 'app/widget/app.dart';
import 'core/utils/managers/database/database_manager.dart';
import 'injections.dart' as injections;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance;
  await injections.init();
  await serviceLocator<LocalNotificationManger>().init();
  await serviceLocator<DatabaseManager>().openBox();
  await serviceLocator<AppBloc>().init();
  await serviceLocator<GraphQlManger>().init();


  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SY')
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );

}
