import 'package:json_annotation/json_annotation.dart';

part 'rick_and_morty_data.g.dart';

@JsonSerializable()
class Character {
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

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class Info {
  int count;
  int pages;
  String? next;
  String? prev;

  Info({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}

@JsonSerializable()
class ResponseData {
  Info info;
  List<Character> results;

  ResponseData({
    required this.info,
    required this.results,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
