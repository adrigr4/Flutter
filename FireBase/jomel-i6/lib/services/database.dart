import 'package:JomelI6/models/user.dart';
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

  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return User(
        email: doc.data['email'] ?? '',
        name: doc.data['name'] ?? '',
        surname: doc.data['surname'] ?? '',
        nickname: doc.data['nickname'] ?? '',
        );
    }).toList();
  }

  // get users stream 
    Stream<List<User>> get users {
      return userCollection.snapshots()
        .map(_userListFromSnapshot);
    } 

}