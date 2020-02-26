import 'package:JomelI6/models/top.dart';
import 'package:JomelI6/screens/tops/tops_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopsList extends StatefulWidget {
  @override
  _TopsListState createState() => _TopsListState();
}

class _TopsListState extends State<TopsList> {
  @override
  Widget build(BuildContext context) {

    final tops = Provider.of<List<Top>>(context);
    
    return ListView.builder(
      itemCount: tops.length,
      itemBuilder: (context, index) {
        return TopTile(top: tops[index]);
      });
  }
}
