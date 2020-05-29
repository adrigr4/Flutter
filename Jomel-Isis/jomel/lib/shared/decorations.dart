import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        fillColor: Colors.white,
        filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0),
        borderRadius:  BorderRadius.all(Radius.circular(32.0))
        ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1.0),
        borderRadius:  BorderRadius.all(Radius.circular(32.0)))
        );