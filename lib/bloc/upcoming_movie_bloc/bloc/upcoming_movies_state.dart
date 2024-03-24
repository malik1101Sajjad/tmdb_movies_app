part of 'upcoming_movies_bloc.dart';

@immutable
sealed class UpcomingMoviesState {}

final class UpcomingMoviesInitial extends UpcomingMoviesState {}

@immutable
class UpcomingMoviesLodingState extends UpcomingMoviesState {}

@immutable
class UpcomingMoviesLoadedState extends UpcomingMoviesState {
  final List<UpcomingMovies> upcomingMovies;
  UpcomingMoviesLoadedState({required this.upcomingMovies});
}

class UpcomingMoviesErrorState extends UpcomingMoviesState {
  final String errorMessage;
  UpcomingMoviesErrorState({required this.errorMessage});
}
