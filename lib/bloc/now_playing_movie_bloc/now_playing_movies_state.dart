part of 'now_playing_movies_bloc.dart';

@immutable
sealed class NowPlayingMoviesState {}

final class NowPlayingMoviesInitial extends NowPlayingMoviesState {}

@immutable
class NowPlayingMoviesLodingState extends NowPlayingMoviesState {}

@immutable
class NowPlayingMoviesLoadedState extends NowPlayingMoviesState {
  final List<NowPlayingMovies> nowPlayingMovies;
  NowPlayingMoviesLoadedState({required this.nowPlayingMovies});
}

class NowPlayingMoviesErrorState extends NowPlayingMoviesState {
  final String errorMessage;
  NowPlayingMoviesErrorState({required this.errorMessage});
}
