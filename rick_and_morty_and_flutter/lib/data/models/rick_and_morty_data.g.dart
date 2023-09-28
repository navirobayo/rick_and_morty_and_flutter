// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rick_and_morty_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
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

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
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

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      count: json['count'] as int,
      pages: json['pages'] as int,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
