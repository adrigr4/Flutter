import 'package:JomelI6/models/userAuth.dart';
import 'package:JomelI6/screens/authenticate/register.dart';
import 'package:JomelI6/screens/home/home.dart';
import 'package:JomelI6/screens/authenticate/sign_in.dart';
import 'package:JomelI6/screens/home/start.dart';
import 'package:JomelI6/screens/users/users.dart';
import 'package:JomelI6/screens/tops/tops.dart';
import 'package:flutter/material.dart';
import 'package:JomelI6/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    Start.tag: (context) => Start(),
    SignIn.tag: (context) => SignIn(),
    Register.tag: (context) => Register(),
    Home.tag: (context) => Home(),
    Users.tag: (context) => Users(),
    Tops.tag: (context) => Tops(),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserAuth>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Start(),
        routes: routes
      ),
    );
  }
}