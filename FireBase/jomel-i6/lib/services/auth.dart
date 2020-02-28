import 'package:JomelI6/models/userAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:JomelI6/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserAuth _userFromFirebaseUser(FirebaseUser user){
    return user != null ? UserAuth(uid: user.uid) : null;
  }

  Stream<UserAuth> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

   Future getCurrentUser() async {
    try{
      FirebaseUser user = await _auth.currentUser();
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData('', 'aaa','Adri', 'agranero', 'probando'); 

      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPasswordAndInfo(String email, String password, String name, String nickName, String description) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(user.uid, email, name, nickName, description); 

      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}