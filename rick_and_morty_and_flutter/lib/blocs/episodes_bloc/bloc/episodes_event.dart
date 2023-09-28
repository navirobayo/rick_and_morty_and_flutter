part of 'episodes_bloc.dart';

@immutable
sealed class EpisodesEvent {}

class EpisodesEventLoad extends EpisodesEvent {
  final int page;

  EpisodesEventLoad({this.page = 1});
}
