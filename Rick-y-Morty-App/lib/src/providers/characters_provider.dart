import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'package:peliculas/src/models/character_model.dart';


class CharactersProvider {

  String _url      = 'https://rickandmortyapi.com/api/';

  bool _cargando     = false;

  List<Character> _characters = new List();

  final _charactersStreamController = StreamController<List<Character>>.broadcast();


  Function(List<Character>) get charactersSink => _charactersStreamController.sink.add;

  Stream<List<Character>> get charactersStream => _charactersStreamController.stream;


  void disposeStreams() {
    _charactersStreamController?.close();
  }


  Future<List<Character>> _procesarRespuesta(String url) async {
    
    var resp = await http.get( 
      Uri.encodeFull(url)
    );
    var decodedData = json.decode(resp.body);

    var characters = new Characters.fromJsonList(decodedData['results']);

    return characters.items;
  }



  Future<List<Character>> getPersonajes() async {

    final resp =  await _procesarRespuesta(_url+"/character");
    _characters.addAll(resp);
    charactersSink( _characters );

    _cargando = false;
    return resp;
    
  }

  Future<List<Character>> findCharacters(String query) async {

    return await _procesarRespuesta(_url+"/character/?name="+query);
    
  }



  // Future<List<Pelicula>> getPopulares() async {
    
  //   if ( _cargando ) return [];

  //   _cargando = true;
  //   _popularesPage++;

  //   final url = Uri.https(_url, '3/movie/popular', {
  //     'api_key'  : _apikey,
  //     'language' : _language,
  //     'page'     : _popularesPage.toString()
  //   });

  //   final resp = await _procesarRespuesta(url);

  //   _populares.addAll(resp);
  //   popularesSink( _populares );

  //   _cargando = false;
  //   return resp;

  // }

  // Future<List<Actor>> getCast( String peliId ) async {

  //   final url = Uri.https(_url, '3/movie/$peliId/credits', {
  //     'api_key'  : _apikey,
  //     'language' : _language
  //   });

  //   final resp = await http.get(url);
  //   final decodedData = json.decode( resp.body );

  //   final cast = new Cast.fromJsonList(decodedData['cast']);

  //   return cast.actores;

  // }


  // Future<List<Pelicula>> buscarPelicula( String query ) async {

  //   final url = Uri.https(_url, '3/search/movie', {
  //     'api_key'  : _apikey,
  //     'language' : _language,
  //     'query'    : query
  //   });

  //   return await _procesarRespuesta(url);

  // }

}