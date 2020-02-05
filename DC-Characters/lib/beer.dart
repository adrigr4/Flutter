class Character {
  final int id;
  final String name;
  final String slug;
  //final String fullName;
  //final PowerStats powerstats;
  //final String image;  

  Character.fromJsonMap(Map<String, dynamic> jsonMap) :
    id = jsonMap['id'],
    name = jsonMap['name'],
    slug = jsonMap['slug'];
    //powerstats = jsonMap['powerstats'],
    //fullName = jsonMap['biography.fullName'],
    //image = jsonMap['images.sm'];
    
}

class Characters {

  List<Character> characters = new List();

  Characters();

  Characters.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {

      final pelicula = new Character.fromJsonMap(item);

      characters.add( pelicula );

    }
  }
}


