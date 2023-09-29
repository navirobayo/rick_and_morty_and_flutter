import 'package:dio/dio.dart';
import 'package:rick_and_morty_and_flutter/models/search_characters_data_ui_model.dart';

class SearchCharactersRepo {
  static Future<List<SearchCharactersDataUiModel>> getSearchCharacters(
      String query) async {
    final dio = Dio();
    List<SearchCharactersDataUiModel> searchCharacters = [];

    try {
      Response response = await dio
          .get('https://rickandmortyapi.com/api/character/', queryParameters: {
        'name': query, // Pass the query parameter to filter by name
      });

      if (response.data['results'] != null) {
        List result = response.data['results'];

        for (int i = 0; i < result.length; i++) {
          SearchCharactersDataUiModel character =
              SearchCharactersDataUiModel.fromJson(
                  result[i] as Map<String, dynamic>);
          searchCharacters.add(character);
        }
      }

      return searchCharacters;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
