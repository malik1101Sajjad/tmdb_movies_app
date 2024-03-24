part of 'tranding_movies_bloc.dart';

@immutable
sealed class TrandingMoviesState {}

@immutable
final class TrandingMoviesInitial extends TrandingMoviesState {}

@immutable
class TrandingMoviesLodingState extends TrandingMoviesState {}

@immutable
class TrandingMoviesLoadedState extends TrandingMoviesState {
  final List<TrandingMovies> trandingmovies;
  TrandingMoviesLoadedState({required this.trandingmovies});
}

class TrandingMoviesErrorState extends TrandingMoviesState {
  final String errorMessage;
  TrandingMoviesErrorState({required this.errorMessage});
}
