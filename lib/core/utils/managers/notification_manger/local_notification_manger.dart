import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


const String soundFileNameRemeber='notification';
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class LocalNotificationManger{



  Future<void> init() async {


    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher',);

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.areNotificationsEnabled( );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );

    const  InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }





  void selectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    // );
  }


  showNotification()async{
    await flutterLocalNotificationsPlugin.show(
        Random().nextInt(100), 'app_name'.tr(), 'you_got_new_health_point'.tr(),
        const NotificationDetails(
      android: AndroidNotificationDetails(
        'your channel id', 'your channel name',
        playSound: true,
        channelDescription: '',
        styleInformation: BigTextStyleInformation(''),),
      iOS:IOSNotificationDetails(sound: 'sound.aiff') ,),
        payload: '');
  }


}