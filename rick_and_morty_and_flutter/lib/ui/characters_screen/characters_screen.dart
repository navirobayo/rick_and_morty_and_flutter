import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_and_flutter/data/models/rick_and_morty_api.dart';
import 'package:rick_and_morty_and_flutter/data/models/rick_and_morty_data.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final Dio _dio = Dio(BaseOptions(contentType: "application/json"));
  late RickAndMortyApi _api;

  @override
  void initState() {
    super.initState();
    _api = RickAndMortyApi(_dio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty Characters'),
      ),
      body: FutureBuilder<ResponseData>(
        future: _api.getCharacters(), // You can specify the page number here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text('No data available.'),
            );
          } else {
            final ResponseData responseData = snapshot.data!;
            final List<Character> characters = responseData.results;

            // Now you can build your UI using the characters list
            return _buildCharacterListView(characters);
          }
        },
      ),
    );
  }

  Widget _buildCharacterListView(List<Character> characters) {
    // Create your UI to display the list of characters here
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final Character character = characters[index];
        return ListTile(
          title: Text(character.name),
          subtitle: Text(character.status),
          // Add more details or widgets as needed
        );
      },
    );
  }
}
