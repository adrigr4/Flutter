import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jomel-Isis',
      initialRoute: 'Splash',
      routes: <String, WidgetBuilder>{
        'Splash': (BuildContext context) => new Splash(),
        'Login': (BuildContext context) => new LoginPage()
      } 
    );
  }
}