import 'package:flutter/material.dart';

class Start extends StatefulWidget {

  final Function toggleStart;
  Start({this.toggleStart});

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            Text('JOMEL-I6 APP', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            Image.asset('assets/images/LOGO1.png'),
            RaisedButton(
              color: Colors.red[400],
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(6.0),
                  side: BorderSide(color: Colors.red)),
              child: Text(
                'Iniciar Sessió',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {},
            ),
            RaisedButton(
                  color: Colors.red[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(6.0),
                    side: BorderSide(color: Colors.red)),
                  child: Text(
                    'Registrar-se', 
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    
                  },
                ), 
          ],
        ),
      ),
    );
  }
}
