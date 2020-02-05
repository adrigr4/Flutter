import 'package:flutter/material.dart';
import 'beer_repository.dart';
import 'beer.dart';
import 'beer_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Character> _beers = <Character>[];

  @override
  void initState() {
    super.initState();
    listenForBeers();
  }

  void listenForBeers() async {
    final Stream<Character> stream = await getCharacters();
    stream.listen((Character character) =>
      setState(() =>  _beers.add(character))
    );
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('SuperHeroes'),
    ),
    body: ListView.builder(
      itemCount: _beers.length,
      itemBuilder: (context, index) => BeerTile(_beers[index]),
    ),
  );
}