import 'package:json_annotation/json_annotation.dart';

part 'character_data_ui_model.g.dart';

@JsonSerializable()
class CharacterDataUiModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Object origin;
  final Object location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  CharacterDataUiModel({
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

  factory CharacterDataUiModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterDataUiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDataUiModelToJson(this);
}
