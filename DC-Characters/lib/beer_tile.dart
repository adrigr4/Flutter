import 'package:flutter/material.dart';
import 'beer.dart';

class BeerTile extends StatelessWidget {
  final Character _beer;
  BeerTile(this._beer);

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      ListTile(
        title: Text(_beer.name),
        subtitle: Text(_beer.slug),
        leading: Container(
          margin: EdgeInsets.only(left: 6.0),
        ),
      ),
      Divider()
    ],
  );
}