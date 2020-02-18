import 'package:JomelI6/screens/authenticate/sign_in.dart';
import 'package:JomelI6/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:JomelI6/services/auth.dart';
import 'package:JomelI6/shared/decorations.dart';
import 'package:JomelI6/shared/loading.dart';

class Register extends StatefulWidget {
  static String tag = 'register';

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String name = '';
  String surname = '';
  String nickname = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.red[300],
            appBar: AppBar(
              backgroundColor: Colors.red,
              elevation: 0.0,
              title: Text('Registre'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Inicia sessió'),
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignIn.tag);
                  },
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Nom'),
                          validator: (val) =>
                              val.isEmpty ? 'Introdueix un text vàlid' : null,
                          onChanged: (val) {
                            setState(() => name = val);
                          }),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Cognom'),
                          validator: (val) =>
                              val.isEmpty ? 'Introdueix un text vàlid' : null,
                          onChanged: (val) {
                            setState(() => surname = val);
                          }),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Nick'),
                          validator: (val) =>
                              val.isEmpty ? 'Introdueix un text vàlid' : null,
                          onChanged: (val) {
                            setState(() => nickname = val);
                          }),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'Introdueix un correu vàlid' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                      SizedBox(height: 20.0),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Contrasenya'),
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Introdueix una contrasenya amb més de 6 caràcters'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          }),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: EdgeInsets.all(15),
                        color: Colors.red,
                        child: Text('Registra\'t',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0)),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result =
                                await _auth.registerWithEmailAndPasswordAndInfo(
                                    email, password, name, surname, nickname);
                            if (result == null) {
                              setState(
                                  () => error = 'please supply a valid email');
                              loading = false;
                            } else {
                              Navigator.of(context).pushNamed(Home.tag);
                            }
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(error,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            ));
  }
}
