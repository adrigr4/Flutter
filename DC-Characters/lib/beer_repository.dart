import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'beer.dart';

class PeliculasProvider {

  String _url = 'https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api';

  bool _cargando     = false;



  List<Character> _characters = new List();

  final _popularesStreamController = StreamController<List<Character>>.broadcast();

  Function(List<Character>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Character>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {

    _popularesStreamController?.close();

  }

  Future<List<Character>> _procesarRespuesta(Uri url) async {


    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);



    final peliculas = new Character.fromJsonList(decodedData['results']);
    return peliculas.items;

  }

}