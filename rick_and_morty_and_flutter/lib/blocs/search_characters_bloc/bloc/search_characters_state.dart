part of 'search_characters_bloc.dart';

@immutable
sealed class SearchCharactersState {}

abstract class SearchCharactersActionState extends SearchCharactersState {}

class SearchCharactersInitial extends SearchCharactersState {}

class SearchCharactersFetchingLoading extends SearchCharactersActionState {}

class SearchCharactersFetchingError extends SearchCharactersActionState {
  final String errorMessage;

  SearchCharactersFetchingError(this.errorMessage);
}

class SearchCharactersFetchingSuccess extends SearchCharactersState {
  final List<SearchCharactersDataUiModel> searchCharacters;

  SearchCharactersFetchingSuccess(this.searchCharacters);
}
