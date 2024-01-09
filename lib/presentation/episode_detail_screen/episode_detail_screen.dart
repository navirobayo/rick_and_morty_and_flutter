import 'package:flutter/material.dart';
import 'package:rick_and_morty_and_flutter/models/episode_data_ui_model.dart';
import 'package:dio/dio.dart'; // Import Dio for making API requests

//* Detailed view of the episode.

// The user can see some name, air_date and episode code
// and also a list of the characters that appear on the episode.
// If the user presses on the list of characters nothing will happen. The list its just view only.

class EpisodeDetailScreen extends StatefulWidget {
  final EpisodeDataUiModel episode;

  const EpisodeDetailScreen({Key? key, required this.episode})
      : super(key: key);

  @override
  State<EpisodeDetailScreen> createState() => _EpisodeDetailScreenState();
}

class _EpisodeDetailScreenState extends State<EpisodeDetailScreen> {
  List<String> characterNames = []; // List to store character names
  bool _isMounted = true;

  @override
  void initState() {
    super.initState();
    loadCharacterNames(); // Fetch character names when the screen loads
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  // Function to fetch character names
  void loadCharacterNames() async {
    final dio = Dio();
    final List<String> urls = widget.episode.characters;

    for (String url in urls) {
      try {
        Response response = await dio.get(url);
        if (_isMounted) {
          final characterName = response.data['name'];
          setState(() {
            characterNames.add(characterName);
          });
        }
      } catch (e) {
        print('Error fetching character details: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multidimensional Visualizer')),
      body: Column(
        children: [
          const SizedBox(height: 25),
          Text('Name: ${widget.episode.name}'),
          Text('Air Date: ${widget.episode.air_date}'),
          Text('Episode: ${widget.episode.episode}'),
          const SizedBox(height: 25),
          const Text('Characters in this Episode:'),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: characterNames.length, // Use characterNames list
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(characterNames[index]), // Display character names
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
