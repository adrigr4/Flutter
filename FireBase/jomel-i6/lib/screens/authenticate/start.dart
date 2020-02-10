import 'package:flutter/material.dart';

class Start extends StatefulWidget {

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            Text('Jomel-I6'),
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
