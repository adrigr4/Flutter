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
    final appBar = AppBar(
      backgroundColor: Colors.red,
      elevation: 0.0,
      title: Text('Registre'),
      /*actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('Inicia sessió'),
          onPressed: () {
            Navigator.of(context).pushNamed(SignIn.tag);
          },
        )
      ],*/
    );

    final nameTextForm = TextFormField(
        decoration: textInputDecoration.copyWith(hintText: 'Nom'),
        validator: (val) => val.isEmpty ? 'Introdueix un text vàlid' : null,
        onChanged: (val) {
          setState(() => name = val);
        });

    final surnameTextForm = TextFormField(
        decoration: textInputDecoration.copyWith(hintText: 'Cognom'),
        validator: (val) => val.isEmpty ? 'Introdueix un text vàlid' : null,
        onChanged: (val) {
          setState(() => surname = val);
        });

    final nickTextForm = TextFormField(
        decoration: textInputDecoration.copyWith(hintText: 'Nick'),
        validator: (val) => val.isEmpty ? 'Introdueix un text vàlid' : null,
        onChanged: (val) {
          setState(() => nickname = val);
        });

    final emailTextForm = TextFormField(
        decoration: textInputDecoration.copyWith(hintText: 'Email'),
        validator: (val) => val.isEmpty ? 'Introdueix un correu vàlid' : null,
        onChanged: (val) {
          setState(() => email = val);
        });

    final passwordText = TextFormField(
        decoration: textInputDecoration.copyWith(hintText: 'Contrasenya'),
        obscureText: true,
        validator: (val) => val.length < 6
            ? 'Introdueix una contrasenya amb més de 6 caràcters'
            : null,
        onChanged: (val) {
          setState(() => password = val);
        });

    final registerButton = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(15),
      color: Colors.red,
      child: Text('Registra\'t',
          style: TextStyle(color: Colors.white, fontSize: 16.0)),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          setState(() => loading = true);
          dynamic result = await _auth.registerWithEmailAndPasswordAndInfo(
              email, password, name, surname, nickname);
          if (result == null) {
            setState(() => error = 'please supply a valid email');
            loading = false;
          } else {
            Navigator.of(context).pushNamed(Home.tag);
          }
        }
      },
    );

    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.red[300],
            appBar: appBar,
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      nameTextForm,
                      SizedBox(height: 20.0),
                      surnameTextForm,
                      SizedBox(height: 20.0),
                      nickTextForm,
                      SizedBox(height: 20.0),
                      emailTextForm,
                      SizedBox(height: 20.0),
                      passwordText,
                      SizedBox(height: 20.0),
                      registerButton,
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
