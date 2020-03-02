import 'package:JomelI6/models/user.dart';
import 'package:JomelI6/models/userAuth.dart';
import 'package:JomelI6/screens/users/users.dart';
import 'package:JomelI6/services/database.dart';
import 'package:JomelI6/shared/decorations.dart';
import 'package:JomelI6/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {

  String userUid;
  SettingsForm({this.userUid});

  @override
  _SettingsFormState createState() => _SettingsFormState(uid: userUid);
}

class _SettingsFormState extends State<SettingsForm> {

  final String uid;
  _SettingsFormState({this.uid});
  final _formKey = GlobalKey<FormState>();

  String _currentName;
  String _currentSurname;
  String _currentNickname;
  String _currentEmail;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserAuth>(context);

    return StreamBuilder<User>(
        stream: DatabaseService(uid: uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){

            User userData = snapshot.data;

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Actualitza les dades de usuari',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration.copyWith(hintText: 'Nom'),
                    validator: (val) =>
                        val.isEmpty ? 'Introdueix un nom' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.surname,
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Cognom'),
                    validator: (val) =>
                        val.isEmpty ? 'Introdueix un cognom' : null,
                    onChanged: (val) => setState(() => _currentSurname = val),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.nickname,
                    decoration: textInputDecoration.copyWith(hintText: 'Nick'),
                    validator: (val) =>
                        val.isEmpty ? 'Introdueix un nick' : null,
                    onChanged: (val) => setState(() => _currentNickname = val),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.email,
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) =>
                        val.isEmpty ? 'Introdueix un email' : null,
                    onChanged: (val) => setState(() => _currentEmail = val),
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.all(15),
                    color: Colors.red,
                    child: Text('Actualitza',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        await DatabaseService(uid: uid).updateUserData(
                          uid, 
                          _currentEmail ?? userData.email,
                          _currentName ?? userData.name,
                          _currentSurname ?? userData.surname,
                          _currentNickname ?? userData.nickname
                          );
                          Navigator.of(context).pushNamed(Users.tag);
                      }
                    },
                  )
                ],
              ));
          }else{
            return Loading();
          }
          
        });
  }
}
