

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthDataSource{
 Future<QuerySnapshot>  login(String name);

 Future<DocumentReference>  addUser(String name);

}

class AuthDataSourceImpl extends AuthDataSource{



  @override
  login(String name) async{
    CollectionReference collection =
    FirebaseFirestore.instance.collection('users');

   return  await collection.where("name",isEqualTo:name).get();

  }

  @override
  addUser(String name) async{

    CollectionReference collection =
    FirebaseFirestore.instance.collection('users');

    return await collection.add({'name': name});
  }

}