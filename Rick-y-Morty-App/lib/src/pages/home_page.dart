import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/characters_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';

import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/character_horizontal.dart';

class HomePage extends StatelessWidget {

  final charactersProvider = new CharactersProvider();

  @override
  Widget build(BuildContext context) {

    charactersProvider.getPersonajes();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Rick y Morty'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.search ),
            onPressed: () {
              showSearch(
                context: context, 
                delegate: DataSearch(),
                // query: 'Hola'
                );
            },
          )
        ],
      ),
      body: DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://fsa.zobj.net/crop.php?r=7lYsNzxk3JTHyO1OA6Alw3sUrrjnJ2LwSYtFElkcySW1MrAXaEjlgcp8rOKgbaKvjby_At0CAOUd8KSq4Wwpik9d8_2_IxrO8RmiR1N5M5tjF4lO1I5Xed4RK1hSH3e8Gwl4ZRfnuzr-sTraG10O-hGjFbX50tgRiKNUUJGEMGrWOD8KdLAVWujSQmkNBoe1bETyX7rzUVLmyE85'),
                    fit: BoxFit.cover),
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context)
          ],
        ),
      )
       
    );
  }

  Widget _swiperTarjetas() {

    return FutureBuilder(
      future: charactersProvider.getPersonajes(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        
        if ( snapshot.hasData ) {
          return CardSwiper( characters: snapshot.data );
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
        
      },
    );
  }


  Widget _footer(BuildContext context){
     
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Protagonistas', style: Theme.of(context).textTheme.subhead )
          ),
          SizedBox(height: 5.0),

          StreamBuilder(
            stream: charactersProvider.charactersStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              
              if ( snapshot.hasData ) {
                return CharacterHoritzontal( 
                  characters: snapshot.data,
                  siguientePagina: charactersProvider.getPersonajes,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }

}