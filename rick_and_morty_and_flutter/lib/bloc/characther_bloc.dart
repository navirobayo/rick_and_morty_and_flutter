import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_and_flutter/data/models/rick_and_morty_api.dart';
import 'package:rick_and_morty_and_flutter/data/models/rick_and_morty_data.dart';

abstract class CharacterEvent {}

class FetchCharacters extends CharacterEvent {}

// Define states for your Bloc
abstract class CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;

  CharacterLoaded(this.characters);
}

class CharacterError extends CharacterState {
  final String error;

  CharacterError(this.error);
}

// Create your Bloc class
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final RickAndMortyApi api;

  CharacterBloc(this.api) : super(CharacterLoading());

  @override
  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    if (event is FetchCharacters) {
      yield CharacterLoading();
      try {
        final response = await api.getCharacters();
        yield CharacterLoaded(response.results);
      } catch (e) {
        yield CharacterError('Failed to fetch characters: $e');
      }
    }
  }
}
