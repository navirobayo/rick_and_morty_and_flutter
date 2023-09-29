import 'package:flutter/material.dart';
import 'package:rick_and_morty_and_flutter/models/character_data_ui_model.dart';
import 'package:rick_and_morty_and_flutter/models/search_characters_data_ui_model.dart';
import 'package:dio/dio.dart'; // Import Dio for making API requests

class CharacterDetailScreen extends StatefulWidget {
  final CharacterDataUiModel character;

  const CharacterDetailScreen({Key? key, required this.character})
      : super(key: key);

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  bool _isExpanded = false;
  List<String> episodeNames = []; // List to store episode names

  @override
  void initState() {
    super.initState();
    loadEpisodeNames(); // Fetch episode names when the screen loads
  }

  // Function to fetch episode names
  void loadEpisodeNames() async {
    final dio = Dio();
    final List<String> episodeUrls = widget.character.episode;

    for (String url in episodeUrls) {
      try {
        Response response = await dio.get(url);
        final episodeName = response.data['name'];
        setState(() {
          episodeNames.add(episodeName);
        });
      } catch (e) {
        print('Error fetching episode details: $e');
      }
    }
  }

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
                      image: NetworkImage(widget.character.image),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('Name: ${widget.character.name}'),
                    Text(' '),
                    Text('Status: ${widget.character.status}'),
                    Text(' '),
                    Text('Species: ${widget.character.species}'),
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
                      title: Text('Episodes with ${widget.character.name}'),
                    );
                  },
                  body: SingleChildScrollView(
                    child: Column(
                      children: episodeNames.map((episodeName) {
                        return ListTile(
                          title: Text(episodeName),
                        );
                      }).toList(),
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
