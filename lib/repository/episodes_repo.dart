import 'package:dio/dio.dart';
import 'package:rick_and_morty_and_flutter/models/episode_data_ui_model.dart';

class EpisodesRepo {
  static Future<List<EpisodeDataUiModel>> getEpisodes({int page = 1}) async {
    final dio = Dio();
    List<EpisodeDataUiModel> episodes = [];

    try {
      Response response =
          await dio.get('https://rickandmortyapi.com/api/episode?page=$page');

      if (response.data['results'] != null) {
        List result = response.data['results'];

        for (int i = 0; i < result.length; i++) {
          EpisodeDataUiModel episode =
              EpisodeDataUiModel.fromJson(result[i] as Map<String, dynamic>);
          episodes.add(episode);
        }
      }

      return episodes;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
