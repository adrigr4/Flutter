import 'package:JomelI6/screens/authenticate/register.dart';
import 'package:JomelI6/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:JomelI6/services/auth.dart';
import 'package:JomelI6/shared/decorations.dart';
import 'package:JomelI6/shared/loading.dart';

class SignIn extends StatefulWidget {
  static String tag = 'sign-in';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    
    final appBar = AppBar(
      backgroundColor: Colors.red,
      elevation: 0.0,
      title: Text('Iniciar sessió'),
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('Registrar-se'),
          onPressed: () {
            Navigator.of(context).pushNamed(Register.tag);
          },
        )
      ],
    );

    final emailTextForm = TextFormField(
        decoration: textInputDecoration.copyWith(hintText: 'Email'),
        validator: (val) => val.isEmpty ? 'Introdueix un email vàlid' : null,
        onChanged: (val) {
          setState(() => email = val);
        });

    final passwordTextForm = TextFormField(
        decoration: textInputDecoration.copyWith(hintText: 'Contrasenya'),
        validator: (val) => val.length < 6
            ? 'Introdueix una contrasenya amb més de 6 caràcters'
            : null,
        obscureText: true,
        onChanged: (val) {
          setState(() => password = val);
        });

    final loginButton = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(15),
      color: Colors.red,
      child: Text('Vamos venga!',
          style: TextStyle(color: Colors.white, fontSize: 16.0)),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          setState(() => loading = true);
          dynamic result =
              await _auth.signInWithEmailAndPassword(email, password);
          if (result == null) {
            setState(() => error = 'Could not sign in with this credentials');
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
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      emailTextForm,
                      SizedBox(height: 20.0),
                      passwordTextForm,
                      SizedBox(height: 20.0),
                      loginButton,
                      SizedBox(height: 12.0),
                      Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0))
                    ],
                  ),
                ),
              ),
            ));
  }
}
