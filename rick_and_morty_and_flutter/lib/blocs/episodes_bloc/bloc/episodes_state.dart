part of 'episodes_bloc.dart';

@immutable
sealed class EpisodesState {}

abstract class EpisodesActionState extends EpisodesState {}

class EpisodesInitial extends EpisodesState {}

class EpisodesFetchingLoading extends EpisodesActionState {}

class EpisodesFetchingError extends EpisodesActionState {
  final String errorMessage;

  EpisodesFetchingError(this.errorMessage);
}

class EpisodesFetchingSuccess extends EpisodesState {
  final List<EpisodeDataUiModel> episodes;

  EpisodesFetchingSuccess(this.episodes);
}
