import 'package:rick_and_morty_and_flutter/features/characters/models/character_data_ui_model.dart';
import 'package:dio/dio.dart';

class CharactersRepo {
  static Future<List<CharacterDataUiModel>> getCharacters() async {
    final dio = Dio();
    List<CharacterDataUiModel> characters = [];
    try {
      Response response =
          await dio.get('https://rickandmortyapi.com/api/character');
      List result = response.data['results'];

      for (int i = 0; i < result.length; i++) {
        CharacterDataUiModel character =
            CharacterDataUiModel.fromJson(result[i] as Map<String, dynamic>);
        characters.add(character);
      }
      return characters;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
