part of 'search_characters_bloc.dart';

@immutable
sealed class SearchCharactersEvent {
  final String? query;

  SearchCharactersEvent({this.query});
}

class SearchCharactersEventLoad extends SearchCharactersEvent {
  final String? query;

  SearchCharactersEventLoad({this.query});
}
