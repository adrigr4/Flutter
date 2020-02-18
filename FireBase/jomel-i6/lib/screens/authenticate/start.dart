import 'package:JomelI6/screens/authenticate/register.dart';
import 'package:JomelI6/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {

  static String tag = 'start';
  final Function toggleStart;
  Start({this.toggleStart});

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 140.0,
        child: Image.asset('assets/launcher/LOGO1.png'),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(SignIn.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.red[200],
        child: Text('Iniciar sessió', style: TextStyle(color: Colors.black, fontSize: 16.0)),
      ),
    );

    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(Register.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.red[200],
        child: Text('Registre', style: TextStyle(color: Colors.black, fontSize: 16.0)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 24.0),
            loginButton,
            registerButton
          ],
        ),
      ),
    );
  }
}
