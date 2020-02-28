import 'package:JomelI6/models/top.dart';
import 'package:JomelI6/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
      String uid, String email, String name, String nickname, String description) async {
    return await userCollection.document(uid).setData({
      'uid': uid,
      'email': email,
      'name': name,
      'surname': nickname,
      'nickname': description,
    });
  }

  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return User(
        uid: doc.data['uid'] ?? '',
        email: doc.data['email'] ?? '',
        name: doc.data['name'] ?? '',
        surname: doc.data['surname'] ?? '',
        nickname: doc.data['nickname'] ?? '',
      );
    }).toList();
  }

  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return User(
      uid: snapshot.data['uid'],
      email: snapshot.data['email'],
      name: snapshot.data['name'] ?? '',
      surname: snapshot.data['surname'] ?? '',
      nickname: snapshot.data['nickname'] ?? '',
    );
  }

  Stream<User> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  // get users stream
  Stream<List<User>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  final CollectionReference topsCollection = Firestore.instance.collection('tops');

  List<Top> _topsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Top(
        name: doc.data['name'] ?? '',
        order: doc.data['order'] ?? '',
      );
    }).toList();
  }

  // get users stream
  Stream<List<Top>> get tops {
    return topsCollection.snapshots().map(_topsListFromSnapshot);
  }
}
