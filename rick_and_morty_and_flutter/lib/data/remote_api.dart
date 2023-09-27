import 'package:dio/dio.dart';

class RemoteApi {
  final Dio _dio = Dio();

  Future<Response> fetchData(String endpoint) async {
    try {
      final response =
          await _dio.get('https://rickandmortyapi.com/api/$endpoint');
      return response;
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }
}
