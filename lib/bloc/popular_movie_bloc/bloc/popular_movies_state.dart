part of 'popular_movies_bloc.dart';

@immutable
sealed class PopularMoviesState {}

final class PopularMoviesInitial extends PopularMoviesState {}

@immutable
class PopularMoviesLodingState extends PopularMoviesState {}

@immutable
class PopularMoviesLoadedState extends PopularMoviesState {
  final List<PopularMovies> popularMovies;
  PopularMoviesLoadedState({required this.popularMovies});
}

class PopularMoviesErrorState extends PopularMoviesState {
  final String errorMessage;
  PopularMoviesErrorState({required this.errorMessage});
}
