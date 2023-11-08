import 'package:connectivity_plus_widget/connectivity/connectivity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_and_flutter/blocs/characters_bloc/characters_bloc.dart';
import 'package:rick_and_morty_and_flutter/blocs/episodes_bloc/bloc/episodes_bloc.dart';
import 'package:rick_and_morty_and_flutter/presentation/about_screen/about_screen.dart';
import 'package:rick_and_morty_and_flutter/presentation/search_characters/search_characters_screen.dart';
import 'package:rick_and_morty_and_flutter/presentation/episode_detail_screen/episode_detail_screen.dart';
import '../character_detail_screen/character_detail_screen.dart';

class MainMenu extends StatefulWidget {
  final String username;
  const MainMenu({super.key, required this.username});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final CharactersBloc charactersBloc = CharactersBloc();
  final EpisodesBloc episodesBloc = EpisodesBloc();

  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    charactersBloc.add(CharactersEventLoad.random());
    episodesBloc.add(EpisodesEventLoad());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              SizedBox(width: 20),
              Text("Multidimensional Visualizer Ver. 2.0.0"),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchCharactersScreen()),
                  );
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                },
                icon: Icon(Icons.texture),
              )
            ],
          ),
          ConnectivityPlusWidget(
            backgroundColor: Colors.red,
            height: 40,
            marquee: true,
            textStyle: const TextStyle(color: Colors.white),
          ),
          //! Random Characters Feature starts here.
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: 300,
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
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    borderRadius: BorderRadius.circular(20)),
                                width: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                state.characters[index].image),
                                          ),
                                        ),
                                      ),
                                      Text(state.characters[index].name),
                                      Text(
                                          "${state.characters[index].status} - ${state.characters[index].species}"),
                                    ],
                                  ),
                                ),
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
          ), //! Random Characters Feature ends here.
          //*
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Some episodes for you:"),
                Spacer(),
                IconButton(
                  onPressed: () {
                    if (currentPage > 1) {
                      setState(() {
                        currentPage--;
                      });
                      episodesBloc.add(EpisodesEventLoad(page: currentPage));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('You are in page 1!')),
                      );
                    }
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Text('$currentPage'),
                IconButton(
                  onPressed: () {
                    if (currentPage >= 3) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('No more pages cowboy')));
                    } else {
                      setState(() {
                        currentPage++;
                      });
                      episodesBloc.add(EpisodesEventLoad(page: currentPage));
                    }
                  },
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          //! Random Episodes Feature starts here.
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 224,
              child: BlocConsumer<EpisodesBloc, EpisodesState>(
                bloc: episodesBloc,
                listenWhen: (previous, current) => current is EpisodesState,
                buildWhen: (previous, current) =>
                    current is! EpisodesActionState,
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
          ), //! Random Episodes Feature ends here.
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text("Wubba Lubba Dub Dub!, ${widget.username}"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.gamepad),
        onPressed: () {
          charactersBloc.add(CharactersEventLoad.random());
          episodesBloc.add(EpisodesEventLoad());
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('R A N D O M I Z E D')));
        },
      ),
    );
  }
}
