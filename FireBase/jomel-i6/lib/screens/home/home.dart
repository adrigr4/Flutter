import 'package:JomelI6/screens/authenticate/start.dart';
import 'package:JomelI6/screens/home/users.dart';
import 'package:JomelI6/screens/tops/tops.dart';
import 'package:flutter/material.dart';
import 'package:JomelI6/services/auth.dart';

class Home extends StatefulWidget {
  static String tag = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    //Obtenir uid usuari actual
    //final userAu = Provider.of<UserAuth>(context).uid;

    final usersButton = RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(15),
        color: Colors.red[100],
        child: Text('Users',
            style: TextStyle(color: Colors.black, fontSize: 16.0)),
        
        onPressed: () {
          Navigator.of(context).pushNamed(Users.tag);
        });

    final topsButton = RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(15),
        color: Colors.red[200],
        child: Text('Tops',
            style: TextStyle(color: Colors.black, fontSize: 16.0)),
        
        onPressed: () {
          Navigator.of(context).pushNamed(Tops.tag);
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
      body: Center(
        child: ListView(
          children: <Widget>[

            usersButton,
            topsButton
          ],
        ),
      ) 
    );
  }
}
