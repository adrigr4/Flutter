import 'dart:async';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

   @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationPage() {
    Navigator.pushNamed(context, 'Login');
  }

  @override
    Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red[700],
        body: Center(    
              child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 200.0,
              child: Image.asset('assets/launcher/LOGO1.png'),
            ),
          )
      );
  }

  /*Widget build(BuildContext context){
    return Container(
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/back_LoginRegistro.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }*/
}