import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(String email, String name, String nickname, String description) async {
    return await userCollection.document(uid).setData({
      'email': email,
      'name': name, 
      'surname': nickname, 
      'nickname': description,
    });
  }

  // get users stream 
    Stream<QuerySnapshot> get users {
      return userCollection.snapshots();
    } 

}