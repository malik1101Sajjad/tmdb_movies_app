import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:netflex_app/models/upcoming_movies_models.dart';
import 'package:netflex_app/repository/upcoming_movies_repository.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  UpcomingMoviesBloc() : super(UpcomingMoviesInitial()) {
    on<UpcomingMoviesEvent>((event, emit) async {
      emit(UpcomingMoviesLodingState());
      try {
        var upcomingMovies =
            await UpcomingMoviesApi().fatchUpcomingMoviesList();
        emit(UpcomingMoviesLoadedState(upcomingMovies: upcomingMovies));
      } catch (e) {
        emit(UpcomingMoviesErrorState(errorMessage: e.toString()));
      }
    });
  }
}
