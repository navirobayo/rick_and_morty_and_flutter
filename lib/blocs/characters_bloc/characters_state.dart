part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

abstract class CharactersActionState extends CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersFetchingLoading extends CharactersActionState {}

class CharactersFetchingError extends CharactersActionState {
  final String errorMessage;

  CharactersFetchingError(this.errorMessage);
}

class CharactersFetchingSuccess extends CharactersState {
  final List<CharacterDataUiModel> characters;

  CharactersFetchingSuccess(this.characters);
}
