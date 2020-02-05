import 'package:flutter/material.dart';

import 'package:peliculas/src/models/character_model.dart';

class CharacterDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Character character = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _crearAppbar(character),
        SliverList(
          delegate: SliverChildListDelegate([            
            SizedBox(height: 10.0),
            _posterTitulo(context, character),
            _descripcion(context, character)
          ]),
        )
      ],
    ));
  }

  Widget _crearAppbar(Character character) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(character.getFondo()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo(BuildContext context, Character character) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: character.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(character.getFoto()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 30.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(character.name,
                    style: Theme.of(context).textTheme.title,
                    overflow: TextOverflow.ellipsis),
                Text(character.species,
                    style: Theme.of(context).textTheme.subhead,
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _descripcion(BuildContext context, Character character) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
             Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Information:\n",
                    style: Theme.of(context).textTheme.title,
                    overflow: TextOverflow.ellipsis),
                Text("Specie: "+ character.species,
                    style: Theme.of(context).textTheme.subhead,
                    overflow: TextOverflow.ellipsis),
                     
                Row(
                  children: <Widget>[
                    Text("Gender: " + character.gender.toString(),
                        style: Theme.of(context).textTheme.subhead),
                  ],
                ), 
                Row(
                  children: <Widget>[
                    Text("Type: " + character.type.toString(),
                        style: Theme.of(context).textTheme.subhead),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Status: " + character.status.toString(),
                        style: Theme.of(context).textTheme.subhead),
                  ],
                ), 
              ],
            ),
          )
          ],
        ));
  }
}
