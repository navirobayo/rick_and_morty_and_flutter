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
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multidimensional Visualizer')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.searchCharacter.image),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('Name: ${widget.searchCharacter.name}'),
                    Text(' '),
                    Text('Status: ${widget.searchCharacter.status}'),
                    Text(' '),
                    Text('Species: ${widget.searchCharacter.species}'),
                  ],
                ),
                SizedBox(width: 25),
              ],
            ),
            SizedBox(height: 50),
            ExpansionPanelList(
              elevation: 1,
              expandedHeaderPadding: EdgeInsets.all(10),
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _isExpanded = !isExpanded;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title:
                          Text('Episodes with ${widget.searchCharacter.name}'),
                    );
                  },
                  body: SingleChildScrollView(
                    // Wrap the content in SingleChildScrollView
                    child: Column(
                      children: widget.searchCharacter.episode
                          .map((episodeUrl) => ListTile(
                                title: Text(episodeUrl),
                              ))
                          .toList(),
                    ),
                  ),
                  isExpanded: _isExpanded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
