class Characters {

  List<Character> items = new List();

  Characters.fromJsonList( List<dynamic> jsonList ){

    if ( jsonList == null ) return;

    jsonList.forEach( (item) {
      final character = Character.fromJsonMap(item);
      items.add(character);
    });
  }

}

class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String image;
  String url;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.url,
  });

  Character.fromJsonMap( Map<String, dynamic> json ) {

    id        = json['id'];
    name      = json['name'];
    status    = json['status'];
    species   = json['species'];
    type      = json['type'];
    gender    = json['gender'];
    image     = json['image'];
    url       = json['url'];

  }

   getFoto() {

    if ( image == null ) {
      return 'http://forum.spaceengine.org/styles/se/theme/images/no_avatar.jpg';
    } else {
      return image;      
    }

  }

  getFondo(){
      return 'https://i.pinimg.com/originals/ef/54/7e/ef547e1bbdfa38f585ef97f1cd8ce7ca.jpg';   
  }

}