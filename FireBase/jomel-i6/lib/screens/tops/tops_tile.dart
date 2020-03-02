import 'dart:developer';
import 'dart:io';

import 'package:JomelI6/models/top.dart';
import 'package:JomelI6/screens/authenticate/register.dart';
import 'package:JomelI6/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TopTile extends StatelessWidget {
  final Top top;
  TopTile({this.top});

  @override
  Widget build(BuildContext context) {
    var mostViewedPosts = Firestore.instance.collection('tops').document('vwdjdFMoZqf3ym0xa1w0').collection('users').document('1');
    var documentRef = Firestore.instance.document(mostViewedPosts.path).path;

    return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(15),
        color: Colors.red[200],
        child: Text(top.name + ' ' +  documentRef,
            style: TextStyle(color: Colors.black, fontSize: 16.0)),
        onPressed: () {
          Navigator.of(context).pushNamed(Register.tag);
        });
  }
}
