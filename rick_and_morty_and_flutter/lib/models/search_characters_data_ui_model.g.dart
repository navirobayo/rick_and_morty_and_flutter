// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_characters_data_ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCharactersDataUiModel _$SearchCharactersDataUiModelFromJson(
        Map<String, dynamic> json) =>
    SearchCharactersDataUiModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: json['origin'] as Object,
      location: json['location'] as Object,
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      url: json['url'] as String,
      created: json['created'] as String,
    );

Map<String, dynamic> _$SearchCharactersDataUiModelToJson(
        SearchCharactersDataUiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'episode': instance.episode,
      'url': instance.url,
      'created': instance.created,
    };
