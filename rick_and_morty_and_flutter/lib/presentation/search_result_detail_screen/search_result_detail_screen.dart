import 'package:flutter/material.dart';
import 'package:rick_and_morty_and_flutter/models/character_data_ui_model.dart';
import 'package:rick_and_morty_and_flutter/models/search_characters_data_ui_model.dart';

class SearchResultDetailScreen extends StatefulWidget {
  final SearchCharactersDataUiModel searchCharacter;

  const SearchResultDetailScreen({Key? key, required this.searchCharacter})
      : super(key: key);

  @override
  State<SearchResultDetailScreen> createState() =>
      _SearchResultDetailScreenState();
}

class _SearchResultDetailScreenState extends State<SearchResultDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Character Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${widget.searchCharacter.name}'),
            Text('Status: ${widget.searchCharacter.status}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
