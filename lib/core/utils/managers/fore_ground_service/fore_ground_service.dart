import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'fore_ground_service_handler.dart';


void startCallback() {

  FlutterForegroundTask.setTaskHandler(ForeGroundServiceHandler());
}

 class ForeGroundService  {

  ReceivePort? _receivePort;

  Future<void> init() async {
     FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'notification_channel_id',
        channelName: 'Foreground Notification',
        channelDescription:
        'This notification appears when the foreground service is running.',
        channelImportance: NotificationChannelImportance.MAX,
        priority: NotificationPriority.LOW,
        iconData: const NotificationIconData(
          resType: ResourceType.mipmap,
          resPrefix: ResourcePrefix.ic,
          name: 'launcher',
          backgroundColor: Colors.orange,
        ),
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: false,
      ),
      foregroundTaskOptions: const ForegroundTaskOptions(
        interval: 5000,
        autoRunOnBoot: false,
        allowWifiLock: true,
      ),
    );

    _ambiguate(WidgetsBinding.instance)?.addPostFrameCallback((_) async {

      if (await FlutterForegroundTask.isRunningService) {
        final newReceivePort = await FlutterForegroundTask.receivePort;
        _registerReceivePort(newReceivePort);
      }
    });

  }

  Future<bool> startForegroundTask() async {

    if (!await FlutterForegroundTask.canDrawOverlays) {
      final isGranted =
      await FlutterForegroundTask.openSystemAlertWindowSettings();
      if (!isGranted) {
        return false;
      }
    }



    if (!await FlutterForegroundTask.isRunningService)  {

      await FlutterForegroundTask.startService(
        notificationTitle: 'Steps Tracker',
        notificationText: 'Tap to return to the app',
        callback:startCallback,
      );
    }

    ReceivePort? receivePort;
      receivePort = await FlutterForegroundTask.receivePort;

      _registerReceivePort(receivePort);

      return true;
  }


  Future<bool> stopForegroundTask() async {
    return await FlutterForegroundTask.stopService();
  }

  bool _registerReceivePort(ReceivePort? receivePort) {
    _closeReceivePort();


    if (receivePort != null) {

      _receivePort = receivePort;
      _receivePort?.listen((message) {
       if (message is String) {
          if (message == 'onNotificationPressed') {


            }

        }
      });

      return true;
    }

    return false;
  }

  void _closeReceivePort() {
    _receivePort?.close();
    _receivePort = null;
  }

  T? _ambiguate<T>(T? value) => value;



}
