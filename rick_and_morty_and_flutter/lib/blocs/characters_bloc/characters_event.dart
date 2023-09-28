part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent {}

class CharactersEventLoad extends CharactersEvent {
  final int page;

  CharactersEventLoad({this.page = 1});
}
