import 'package:flutter/material.dart';
import 'package:login_firebase/models/user.dart';
import 'package:login_firebase/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:login_firebase/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    print(user);
      
      //return either home or Authenticate widget
      if (user == null){
        return Authenticate();
      }else{
        return Home();
      }
  }
}