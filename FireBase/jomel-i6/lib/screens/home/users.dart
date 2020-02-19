import 'package:JomelI6/models/user.dart';
import 'package:JomelI6/models/userAuth.dart';
import 'package:JomelI6/screens/authenticate/start.dart';
import 'package:JomelI6/screens/home/user_list.dart';
import 'package:JomelI6/shared/decorations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:JomelI6/services/auth.dart';
import 'package:JomelI6/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:JomelI6/screens/home/user_list.dart';

class Users extends StatefulWidget {
  static String tag = 'users';

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    String name = '';
    String uid = '';

    //Obtenir uid usuari actual
    //final userAu = Provider.of<UserAuth>(context).uid;

    return StreamProvider<List<User>>.value(
        value: DatabaseService().users,
        child: Scaffold(
          backgroundColor: Colors.red[300],
          appBar: AppBar(
            title: Text(("Jomel-i6"), style: TextStyle(fontSize: 23.0, fontStyle: FontStyle.italic),),
            backgroundColor: Colors.red,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Text(''),
                label: Text(('Sortir'),style: TextStyle(fontWeight: FontWeight.bold),),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.of(context).pushNamed(Start.tag);
                },
              )
            ],
          ),
          body: UserList(),
        ));
  }
}
