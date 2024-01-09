part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent {}

class CharactersEventLoad extends CharactersEvent {
  final int page;

  CharactersEventLoad({this.page = 1});

  factory CharactersEventLoad.random() {
    final randomPage = Random().nextInt(42) + 1;
    return CharactersEventLoad(page: randomPage);
  }
}
