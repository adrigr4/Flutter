import 'package:JomelI6/screens/authenticate/register.dart';
import 'package:JomelI6/screens/authenticate/sign_in.dart';
import 'package:JomelI6/screens/home/home.dart';
import 'package:JomelI6/services/auth.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {

  static String tag = 'start';  

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  
  final AuthService _auth = AuthService();
  bool loading = false;
  String error = '';

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

    final loginAnonButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          setState(() => loading = true);
          dynamic result =
              await _auth.signInAnon();
          if (result == null) {
            setState(() => error = 'Could not sign in');
            loading = false;
          } else {
            Navigator.of(context).pushNamed(Home.tag);
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.red[200],
        child: Text('Entrar com a convidat', style: TextStyle(color: Colors.black, fontSize: 16.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
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
      padding: EdgeInsets.symmetric(vertical: 10.0),
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
            SizedBox(height: 40.0,),
            loginButton,
            loginAnonButton,
            registerButton
          ],
        ),
      ),
    );
  }
}
