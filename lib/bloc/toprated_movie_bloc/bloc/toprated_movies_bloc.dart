import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:netflex_app/models/toprated_movies_models.dart';
import 'package:netflex_app/repository/toprated_movies_repository.dart';

part 'toprated_movies_event.dart';
part 'toprated_movies_state.dart';

class TopratedMoviesBloc
    extends Bloc<TopratedMoviesEvent, TopratedMoviesState> {
  TopratedMoviesBloc() : super(TopratedMoviesInitial()) {
    on<TopratedMoviesEvent>((event, emit) async {
      emit(TopratedMoviesLodingState());
      try {
        var topratedMovies =
            await TopratedMoviesApi().fatchTopratedMoviesList();
        emit(TopratedMoviesLoadedState(topratedMovies: topratedMovies));
      } catch (e) {
        emit(TopratedMoviesErrorState(errorMessage: e.toString()));
      }
    });
  }
}
