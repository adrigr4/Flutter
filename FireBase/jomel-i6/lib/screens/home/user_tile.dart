
import 'package:JomelI6/models/user.dart';
import 'package:JomelI6/screens/home/settings_form.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final User user;
  UserTile({this.user});

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(String uid){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(userUid: uid),
        );
      });
    }

    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
        child: ListTile(          
          leading: FlutterLogo(size: 72.0),
          title: Text(user.nickname),
          subtitle: Text(user.name + ' ' + user.surname + '                   ' + user.email),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            new IconButton(
              icon: Icon(Icons.more_vert), 
              onPressed: () => _showSettingsPanel(user.uid),
            ),
            new IconButton(
              icon: Icon(Icons.delete), 
              onPressed: () => _showSettingsPanel(user.uid),
            ),
            ]
          ),
          isThreeLine: true
        ),
      ),
    );
  }
}
