import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/character_model.dart';
import 'package:peliculas/src/pages/character_detalle.dart';


class CardSwiper extends StatelessWidget {
  
  final List<Character> characters;
  
  CardSwiper({ @required this.characters });

  
  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;

    return Container(
       padding: EdgeInsets.only(top: 10.0),
       child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          itemBuilder: (BuildContext context, int index){

            return Hero(
              tag: characters[index].id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: ()=> Navigator.pushNamed(context, 'detalle', arguments: characters[index]),
                  child: FadeInImage(
                    image: NetworkImage( characters[index].getFoto()  ),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                  ),
                )
              ),
            );
            
          },
          itemCount: characters.length,
          // pagination: new SwiperPagination(),
          // control: new SwiperControl(),
      ),
    );

  }
}
