import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_and_flutter/blocs/episodes_bloc/bloc/episodes_bloc.dart';
import 'package:rick_and_morty_and_flutter/presentation/episode_detail_screen/episode_detail_screen.dart';

//* Lists of episodes.

class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({super.key});

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen> {
  final EpisodesBloc episodesBloc = EpisodesBloc();
  int currentPage = 1;

  @override
  void initState() {
    episodesBloc.add(EpisodesEventLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Episodes')),
      body: BlocConsumer<EpisodesBloc, EpisodesState>(
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ElevatedButton(
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
              child: Text('<-'),
            ),
            Text('Page $currentPage'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentPage++;
                });
                episodesBloc.add(EpisodesEventLoad(page: currentPage));
              },
              child: Text('->'),
            ),
          ],
        ),
      ),
    );
  }
}
