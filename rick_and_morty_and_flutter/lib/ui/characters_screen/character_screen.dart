import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_and_flutter/features/characters/bloc/characters_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final CharactersBloc charactersBloc = CharactersBloc();

  @override
  void initState() {
    charactersBloc.add(CharactersEventLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Characters')),
      body: BlocConsumer<CharactersBloc, CharactersState>(
        bloc: charactersBloc,
        listenWhen: (previous, current) => current is CharactersActionState,
        buildWhen: (previous, current) => current is! CharactersActionState,
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
                itemCount: successstate.characters.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.characters[index].name),
                    subtitle: Text(state.characters[index].status),
                  );
                },
              );
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
