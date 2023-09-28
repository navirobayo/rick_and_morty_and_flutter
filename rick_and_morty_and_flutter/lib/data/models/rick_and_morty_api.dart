import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'rick_and_morty_data.dart';

part 'rick_and_morty_api.g.dart';

@RestApi(baseUrl: 'https://rickandmortyapi.com/api/')
abstract class RickAndMortyApi {
  factory RickAndMortyApi(Dio dio, {String baseUrl}) = _RickAndMortyApi;

  @GET('character')
  Future<ResponseData> getCharacters();
}
