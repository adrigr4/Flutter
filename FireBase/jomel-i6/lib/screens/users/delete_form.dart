import 'package:JomelI6/models/user.dart';
import 'package:JomelI6/models/userAuth.dart';
import 'package:JomelI6/screens/users/users.dart';
import 'package:JomelI6/services/database.dart';
import 'package:JomelI6/shared/decorations.dart';
import 'package:JomelI6/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteForm extends StatefulWidget {

  String userUid;
  DeleteForm({this.userUid});

  @override
  _DeleteFormState createState() => _DeleteFormState(uid: userUid);
}

class _DeleteFormState extends State<DeleteForm> {

  final String uid;
  _DeleteFormState({this.uid});
  final _formKey = GlobalKey<FormState>();

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
                    'Estàs segur que vols eliminar aquest usuari?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    userData.nickname,
                    style: TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.all(15),
                    color: Colors.red,
                    child: Text('Elimina',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        await DatabaseService(uid: uid).deleteUserData(uid);
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