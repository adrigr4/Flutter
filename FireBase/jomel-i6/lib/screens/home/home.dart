import 'package:JomelI6/models/user.dart';
import 'package:JomelI6/models/userAuth.dart';
import 'package:JomelI6/screens/authenticate/start.dart';
import 'package:JomelI6/screens/home/users.dart';
import 'package:JomelI6/shared/decorations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:JomelI6/services/auth.dart';
import 'package:JomelI6/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:JomelI6/screens/home/user_list.dart';

class Home extends StatefulWidget {
  static String tag = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    String name = '';
    String uid = '';

    //Obtenir uid usuari actual
    //final userAu = Provider.of<UserAuth>(context).uid;

    final usersButton = RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(15),
        color: Colors.red,
        child: Text('Users',
            style: TextStyle(color: Colors.white, fontSize: 16.0)),
        
        onPressed: () {
          Navigator.of(context).pushNamed(Users.tag);
        });

    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        title: Text(
          ("Jomel-i6"),
          style: TextStyle(fontSize: 23.0, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.red,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Text(''),
            label: Text(
              ('Sortir'),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              await _auth.signOut();
              Navigator.of(context).pushNamed(Start.tag);
            },
          )
        ],
      ),
      body: usersButton,
    );
  }
}
