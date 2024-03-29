import 'package:flutter/material.dart';
import 'package:JomelI6/models/user.dart';
import 'package:JomelI6/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:JomelI6/screens/home/home.dart';

import 'home/start.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    print(user);
      
      //return either home or Authenticate widget
      if (user == null){
        return Start();
      }else{
        return Home();
      }
  }
}