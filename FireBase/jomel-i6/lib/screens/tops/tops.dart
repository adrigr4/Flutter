import 'package:JomelI6/models/top.dart';
import 'package:JomelI6/screens/authenticate/register.dart';
import 'package:JomelI6/screens/home/start.dart';
import 'package:JomelI6/screens/tops/tops_list.dart';
import 'package:flutter/material.dart';
import 'package:JomelI6/services/auth.dart';
import 'package:JomelI6/services/database.dart';
import 'package:provider/provider.dart';

class Tops extends StatefulWidget {
  static String tag = 'tops';

  @override
  _TopsState createState() => _TopsState();
}

class _TopsState extends State<Tops> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    //Obtenir uid usuari actual
    //final userAu = Provider.of<UserAuth>(context).uid;

    return StreamProvider<List<Top>>.value(
        value: DatabaseService().tops,
        child: Scaffold(
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
          body: TopsList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Register.tag);
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.black,
          ),
        ));
  }
}