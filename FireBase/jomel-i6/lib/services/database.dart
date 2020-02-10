import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(String name, String nickname, String description) async {
    return await userCollection.document(uid).setData({
      'name': name, 
      'nickname': nickname, 
      'description': description,
    });
  }

  // get users stream 
    Stream<QuerySnapshot> get users {
      return userCollection.snapshots();
    } 

}