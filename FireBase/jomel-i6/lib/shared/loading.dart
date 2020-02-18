import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[300],
      child: Center(
        child: SpinKitRing(
          color: Colors.black,
          size: 75.0,
        ),
      ),
    );
  }
}