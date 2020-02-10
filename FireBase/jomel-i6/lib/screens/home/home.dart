import 'package:flutter/material.dart';
import 'package:JomelI6/services/auth.dart';
import 'package:JomelI6/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:JomelI6/screens/home/user_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
        value: DatabaseService().users,
        child: Scaffold(
          backgroundColor: Colors.red[200],
          appBar: AppBar(
            title: Text('Benvigut a FireBase'),
            backgroundColor: Colors.red[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Sortir'),
                onPressed: () async {
                  await _auth.signOut();
                },
              )
            ],
          ),
          body: UserList(),
        )
    );
  }
}
