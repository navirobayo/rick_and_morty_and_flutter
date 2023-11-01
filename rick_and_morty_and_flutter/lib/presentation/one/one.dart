import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_and_flutter/blocs/characters_bloc/characters_bloc.dart';
import 'package:rick_and_morty_and_flutter/blocs/episodes_bloc/bloc/episodes_bloc.dart';
import 'package:rick_and_morty_and_flutter/blocs/search_characters_bloc/bloc/search_characters_bloc.dart';
import 'package:rick_and_morty_and_flutter/presentation/search_characters/search_characters_screen.dart';
import 'package:rick_and_morty_and_flutter/presentation/episode_detail_screen/episode_detail_screen.dart';

import '../character_detail_screen/character_detail_screen.dart';

class One extends StatefulWidget {
  const One({super.key});

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  final SearchCharactersBloc searchCharactersBloc = SearchCharactersBloc();
  final CharactersBloc charactersBloc = CharactersBloc();
  final EpisodesBloc episodesBloc = EpisodesBloc();

  @override
  void initState() {
    searchCharactersBloc.add(SearchCharactersEventLoad());
    charactersBloc.add(CharactersEventLoad());
    episodesBloc.add(EpisodesEventLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, color: Colors.black),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            child: Text("Search Characters"),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SearchCharactersScreen()),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 50.0,
            width: size.width,
            child: BlocConsumer<CharactersBloc, CharactersState>(
              bloc: charactersBloc,
              listenWhen: (previous, current) =>
                  current is CharactersActionState,
              buildWhen: (previous, current) =>
                  current is! CharactersActionState,
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.runtimeType) {
                  case CharactersFetchingLoading:
                    return const Center(child: CircularProgressIndicator());
                  case CharactersFetchingError:
                    final errorstate = state as CharactersFetchingError;
                    return Center(child: Text(errorstate.errorMessage));
                  case CharactersFetchingSuccess:
                    final successstate = state as CharactersFetchingSuccess;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: successstate.characters.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(color: Colors.white),
                                child: Text(state.characters[index].name),
                                width: 200,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CharacterDetailScreen(
                                        //* Temporary
                                        character: state.characters[index]),
                                  ),
                                );
                              }),
                        );
                      },
                    );
                  default:
                    return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Container(
            height: 80,
            child: BlocConsumer<EpisodesBloc, EpisodesState>(
              bloc: episodesBloc,
              listenWhen: (previous, current) => current is EpisodesState,
              buildWhen: (previous, current) => current is! EpisodesActionState,
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.runtimeType) {
                  case EpisodesFetchingLoading:
                    return const Center(child: CircularProgressIndicator());
                  case EpisodesFetchingError:
                    final errorstate = state as EpisodesFetchingError;
                    return Center(child: Text(errorstate.errorMessage));
                  case EpisodesFetchingSuccess:
                    final successstate = state as EpisodesFetchingSuccess;
                    return ListView.builder(
                      itemCount: successstate.episodes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.episodes[index].name),
                          subtitle: Text(state.episodes[index].air_date),
                          trailing: Text(state.episodes[index].episode),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EpisodeDetailScreen(
                                    episode: state.episodes[index]),
                              ),
                            );
                          },
                        );
                      },
                    );
                  default:
                    return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
