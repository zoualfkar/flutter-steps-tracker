import 'dart:async';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:steps_tracker/app/logic/app_settings.dart';
import 'package:steps_tracker/core/utils/managers/tracker_manger/tracker_manger.dart';
import 'package:steps_tracker/injections.dart';

class ForeGroundServiceHandler extends TaskHandler {
SendPort? sendPort;
int eventCount = 0;
late StreamSubscription? streamSubscriptionStepCountStream;

@override
Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {

  debugPrint('[notification service] started ');


  AppSettings trackManger =serviceLocator<AppSettings>();


  debugPrint('[notification service] started 1  ${trackManger.userId}');

  sendPort = sendPort;

  final customData =
  await FlutterForegroundTask.getData<String>(key: 'customData');
  debugPrint('customData: $customData');
}

@override
Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {
  debugPrint('[notification service] onEvent ');

  TrackManger trackManger =serviceLocator<TrackManger>();

  debugPrint('[notification service] onEvent1 ');


  if(streamSubscriptionStepCountStream!=null){
    streamSubscriptionStepCountStream=  trackManger.listen((event) {

      trackManger.localStep =event.steps;

      trackManger.userEntity!.count+= (trackManger.localStep - trackManger.userEntity!.totalCount);

      int newHealthPoint= trackManger.userEntity!.count % 100;

      if(newHealthPoint>0){
        /// show notification
      }
    });
  }


  debugPrint('[notification service] onEvent');
  sendPort?.send(eventCount);

}

@override
Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
  streamSubscriptionStepCountStream?.cancel();
  await FlutterForegroundTask.clearAllData();
}

@override
void onButtonPressed(String id) {
  debugPrint('onButtonPressed >> $id');
}

@override
void onNotificationPressed() {
  debugPrint('[notification service] pressed handler');
  FlutterForegroundTask.launchApp("/");
  sendPort?.send('onNotificationPressed');
}
}

