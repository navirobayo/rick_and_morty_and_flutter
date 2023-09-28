import 'package:rick_and_morty_and_flutter/models/character_data_ui_model.dart';
import 'package:dio/dio.dart';

class CharactersRepo {
  static Future<List<CharacterDataUiModel>> getCharacters(
      {int page = 1}) async {
    final dio = Dio();
    List<CharacterDataUiModel> characters = [];

    try {
      Response response =
          await dio.get('https://rickandmortyapi.com/api/character?page=$page');

      if (response.data['results'] != null) {
        List result = response.data['results'];

        for (int i = 0; i < result.length; i++) {
          CharacterDataUiModel character =
              CharacterDataUiModel.fromJson(result[i] as Map<String, dynamic>);
          characters.add(character);
        }
      }

      return characters;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
