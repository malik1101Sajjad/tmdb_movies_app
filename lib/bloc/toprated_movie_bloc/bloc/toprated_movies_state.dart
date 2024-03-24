part of 'toprated_movies_bloc.dart';

@immutable
sealed class TopratedMoviesState {}

final class TopratedMoviesInitial extends TopratedMoviesState {}
@immutable
class TopratedMoviesLodingState extends TopratedMoviesState {}

@immutable
class TopratedMoviesLoadedState extends TopratedMoviesState {
  final List<TopratedMovies> topratedMovies;
  TopratedMoviesLoadedState({required this.topratedMovies});
}

class TopratedMoviesErrorState extends TopratedMoviesState {
  final String errorMessage;
  TopratedMoviesErrorState({required this.errorMessage});
}
