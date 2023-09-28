import 'package:json_annotation/json_annotation.dart';

part 'episode_data_ui_model.g.dart';

@JsonSerializable()
class EpisodeDataUiModel {
  final int id;
  final String name;
  final String air_date;
  final String episode;
  final List<String> characters;
  final String url;
  final String created;

  EpisodeDataUiModel({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  factory EpisodeDataUiModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDataUiModelFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeDataUiModelToJson(this);
}
