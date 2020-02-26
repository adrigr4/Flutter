import 'package:JomelI6/models/top.dart';
import 'package:JomelI6/screens/authenticate/register.dart';
import 'package:flutter/material.dart';

class TopTile extends StatelessWidget{
  final Top top;
  TopTile({ this.top });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(15),
        color: Colors.red[200],
        child: Text(top.name,
            style: TextStyle(color: Colors.black, fontSize: 16.0)),
        
        onPressed: () {
          Navigator.of(context).pushNamed(Register.tag);
        });
  }
}