import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:netflex_app/models/popular_movies_models.dart';
import 'package:netflex_app/repository/popular_movies_repository.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc() : super(PopularMoviesInitial()) {
    on<PopularMoviesEvent>((event, emit) async {
      emit(PopularMoviesLodingState());
      try {
        var popularMovies = await PopularMoviesApi().fatchPopularMoviesList();
        emit(PopularMoviesLoadedState(popularMovies: popularMovies));
      } catch (e) {
        emit(PopularMoviesErrorState(errorMessage: e.toString()));
      }
    });
  }
}
