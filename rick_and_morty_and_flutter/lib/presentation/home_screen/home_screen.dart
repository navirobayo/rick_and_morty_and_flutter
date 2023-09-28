import 'package:flutter/material.dart';
import 'package:rick_and_morty_and_flutter/persistence/common_widgets/cool_route_button.dart';
import 'package:rick_and_morty_and_flutter/persistence/common_widgets/cool_text_for_route_button.dart';
import 'package:rick_and_morty_and_flutter/persistence/strings/global_strings.dart';
import 'package:rick_and_morty_and_flutter/presentation/character_search_screen/character_search_screen.dart';
import 'package:rick_and_morty_and_flutter/presentation/characters_screen/character_screen.dart';
import 'package:rick_and_morty_and_flutter/presentation/episodes_screen/episodes_screen.dart';

//* Main features of the app.

double defaultTextSpacer = 60;
double defaultCardSpacer = 20;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(appName),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Spacer(),
          Center(
            child: Container(
              child: Row(
                children: [
                  // Left Column: Text Widgets
                  Expanded(
                    flex: 1, // Takes half of the available space
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 40),
                        CoolTextForRouteButton(
                            text: "Characters", context: context),
                        SizedBox(height: defaultTextSpacer),
                        CoolTextForRouteButton(
                            text: "Episodes", context: context),
                        SizedBox(height: defaultTextSpacer),
                        CoolTextForRouteButton(
                            text: "Search character", context: context),
                        SizedBox(height: defaultTextSpacer),
                      ],
                    ),
                  ),
                  // Right Column: Card Buttons
                  Expanded(
                    flex: 1, // Takes half of the available space
                    child: Column(
                      children: [
                        CoolRouteButton(
                            context: context,
                            icon: Icons.person,
                            page: CharactersScreen()),
                        SizedBox(height: defaultCardSpacer),
                        CoolRouteButton(
                            context: context,
                            icon: Icons.memory_sharp,
                            page: EpisodesScreen()),
                        SizedBox(height: defaultCardSpacer),
                        CoolRouteButton(
                            context: context,
                            icon: Icons.search,
                            page: CharacterSearchScreen()),
                        SizedBox(height: defaultCardSpacer),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
