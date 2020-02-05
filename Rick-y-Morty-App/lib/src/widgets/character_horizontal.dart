import 'package:flutter/material.dart';
import 'package:peliculas/src/models/character_model.dart';


class CharacterHoritzontal extends StatelessWidget {

  final List<Character> characters;
  final Function siguientePagina;

  CharacterHoritzontal({ @required this.characters, @required this.siguientePagina });

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );


  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener( () {

      if ( _pageController.position.pixels >= _pageController.position.maxScrollExtent - 200 ){
        siguientePagina();
      }

    });


    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        // children: _tarjetas(context),
        itemCount: characters.length,
        itemBuilder: ( context, i ) => _tarjeta(context, characters[i] ),
      ),
    );


  }

  Widget _tarjeta(BuildContext context, Character character) {

    final tarjeta = Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: character.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage( character.getFoto() ),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 120.0,
                ),
              ),
            ),
          ],
        ),
      );

    return GestureDetector(
      child: tarjeta,
      onTap: (){

        Navigator.pushNamed(context, 'detalle', arguments: character );

      },
    );

  }
}
