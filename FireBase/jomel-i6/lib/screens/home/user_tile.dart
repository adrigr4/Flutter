import 'package:JomelI6/models/user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget{
  final User user;
  UserTile({ this.user });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile( 
          leading: CircleAvatar( 
            radius: 25.0,
            backgroundColor: Colors.red[100],
          ),
          title: Text(user.name),
          subtitle: Text(user.surname),
        ),
       ),
      );
  }
}