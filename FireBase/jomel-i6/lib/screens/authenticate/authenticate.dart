import 'package:JomelI6/screens/authenticate/start.dart';
import 'package:flutter/material.dart';
import 'package:JomelI6/screens/authenticate/sign_in.dart';
import 'package:JomelI6/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  bool startPage = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
    
  }
  void toggleStart() {
    setState(() => startPage = !startPage);
  }

  @override
  Widget build(BuildContext context) {
    if(startPage){
    }else{
    }
  }
}
