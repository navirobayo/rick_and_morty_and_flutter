/* class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Object origin;
  Object location;
  String image;
  List<String> episode;
  String url;
  String created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: json['origin'],
      location: json['location'],
      image: json['image'],
      episode: List<String>.from(json['episode']),
      url: json['url'],
      created: json['created'],
    );
  }
} */ 


//Not used yet. Delete if not needed.
