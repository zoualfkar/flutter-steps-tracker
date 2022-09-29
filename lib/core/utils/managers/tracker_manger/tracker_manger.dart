import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:steps_tracker/features/home/domain/entities/user_entity.dart';

class TrackManger{

  Stream<StepCount>? stepCountStream;
  UserEntity? userEntity;
  int localStep=0;

  TrackManger(){
    initPlatformState();
  }





  void onStepCountError(error) {
    /// Handle the error
  }

  Future<void> initPlatformState() async {
    /// Init streams
    stepCountStream =  Pedometer.stepCountStream.asBroadcastStream();
  }


  /// Listen to streams
  listen(Function(StepCount) onStepCount) async{
    if(stepCountStream==null) await initPlatformState();

  return  stepCountStream?.listen((event){
    onStepCount(event);
  }).onError(onStepCountError);
  }



}