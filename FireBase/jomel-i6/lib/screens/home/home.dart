import 'dart:async';

import 'package:JomelI6/models/user.dart';
import 'package:JomelI6/models/userAuth.dart';
import 'package:JomelI6/screens/authenticate/start.dart';
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

    final userAu = Provider.of<UserAuth>(context);
    final user = Provider.of<List<User>>(context).last.name;
    

    return StreamProvider<List<User>>.value(
        value: DatabaseService().users,
        child: Scaffold(
          backgroundColor: Colors.red[300],
          appBar: AppBar(
            title: Text(user),
            backgroundColor: Colors.red[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Sortir'),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.of(context).pushNamed(Start.tag);
                },
              )
            ],
          ),
          //body: UserList(),
        ));
  }
}
