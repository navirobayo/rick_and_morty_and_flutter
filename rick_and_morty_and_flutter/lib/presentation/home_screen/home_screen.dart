import 'package:flutter/material.dart';
import 'package:rick_and_morty_and_flutter/persistence/common_widgets/cool_route_button.dart';
import 'package:rick_and_morty_and_flutter/persistence/common_widgets/cool_text_for_route_button.dart';
import 'package:rick_and_morty_and_flutter/persistence/rick_and_morty_custom_icons/ra_m_custom_icons_icons.dart';
import 'package:rick_and_morty_and_flutter/persistence/strings/global_strings.dart';
import 'package:rick_and_morty_and_flutter/presentation/characters_screen/characters_screen.dart';
import 'package:rick_and_morty_and_flutter/presentation/episodes_screen/episodes_screen.dart';
import 'package:rick_and_morty_and_flutter/presentation/search_characters/search_characters_screen.dart';

//* Main menu of the app.

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
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Row(
                children: [
                  // Left Column: Text Widgets
                  Expanded(
                    flex: 1, // Takes half of the available space
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 40),
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
                            icon: RaMCustomIcons.rickface1,
                            page: CharactersScreen()),
                        SizedBox(height: defaultCardSpacer),
                        CoolRouteButton(
                            context: context,
                            icon: RaMCustomIcons.mortyface1,
                            page: EpisodesScreen()),
                        SizedBox(height: defaultCardSpacer),
                        CoolRouteButton(
                            context: context,
                            icon: Icons.search,
                            page: SearchCharactersScreen()),
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
