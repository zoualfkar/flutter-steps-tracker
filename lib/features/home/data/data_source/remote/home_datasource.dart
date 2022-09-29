import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:steps_tracker/app/logic/app_settings.dart';
import 'package:steps_tracker/injections.dart';

abstract class HomeDataSource{


  Future<Map<String,dynamic>> getUserData();

  Future saveUserData({
    required int count,
    required int totalCount,
    required int healthPoint,
  });
Future  addToHistory({
  required String userId,
  required int count,
  required String date,
});

  Future<List> getExchangeHistory({
    required String userId,
  });

  Future<List> getUsers();

  Future getReward({
    required String partnerId,
    required int rewardId
  });

  Future<List<Map<String,dynamic>>> getUserRewards();
}

class HomeDataSourceImpl extends HomeDataSource{

  @override
  Future<Map<String,dynamic>> getUserData() async{
    String? userId= serviceLocator<AppSettings>().userId;
    CollectionReference collection= FirebaseFirestore.instance.collection('users');
    var res= await collection.doc(userId).get();
    return res.data() as Map<String,dynamic>;
  }

  @override
 Future addToHistory({
    required String userId,
    required int count,
    required String date,
  }) async{
    CollectionReference collection= FirebaseFirestore.instance.collection('history');
     await collection.add({
      'userId':userId,
      'count':count,
      'date':date,
    });
  }

  @override
  Future<List> getUsers() async{
    CollectionReference collection= FirebaseFirestore.instance.collection('users');
    var res= await collection.get();
    var data=  res.docs.map((e) {
     Map map= e.data() as Map<String,dynamic>;
     map['id'] =e.id;
     return map;
    }).toList();
    return data;
  }

  @override
  Future saveUserData({
    required int count,
    required int totalCount,
    required int healthPoint,
  }) async{

    String? userId= serviceLocator<AppSettings>().userId;
    CollectionReference collection= FirebaseFirestore.instance.collection('users');
     await collection.doc(userId).update({
      'count':count,
      'totalCount':totalCount,
      'healthPoint':healthPoint,
    });
  }

  @override
  Future<List> getExchangeHistory({required String userId}) async{
    CollectionReference collection= FirebaseFirestore.instance.collection('history');
    var res= await collection.where('userId',isEqualTo:userId ).get();
    return res.docs.map((e) => e.data()).toList();

  }

  @override
  Future getReward({required String partnerId, required int rewardId}) async{
    String? userId= serviceLocator<AppSettings>().userId;
    CollectionReference collection= FirebaseFirestore.instance.collection('rewards');
     await collection.add({
      'rewardId':rewardId,
      'users':[userId,partnerId],
    });
  }

  @override
  Future<List<Map<String,dynamic>>> getUserRewards() async{
    String? userId= serviceLocator<AppSettings>().userId;
    CollectionReference collection= FirebaseFirestore.instance.collection('rewards');
    CollectionReference collectionUsers= FirebaseFirestore.instance.collection('users');

    var res= await collection.where('users',arrayContains: userId).get();

    var data=  res.docs.map((e) => e.data() as Map<String,dynamic>).toList();

    for(var item in data){
      if(item['users'][0]!=userId) {
        item['partner']=(await collectionUsers.doc(item['users'][0]).get()).data();
      } else {
        item['partner']=(await collectionUsers.doc(item['users'][1]).get()).data();
      }
    }
    return data;

  }





}