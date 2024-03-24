import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:netflex_app/models/tranding_movies_models.dart';
import 'package:netflex_app/repository/tranding_movies_repository.dart';

part 'tranding_movies_event.dart';
part 'tranding_movies_state.dart';

class TrandingMoviesBloc
    extends Bloc<TrandingMoviesEvent, TrandingMoviesState> {
  TrandingMoviesBloc() : super(TrandingMoviesInitial()) {
    on<TrandingMoviesEvent>((event, emit) async {
      emit(TrandingMoviesLodingState());
      try {
        var trandingMovies =
            await TrandingMoviesApi().fatchTrandingMoviesList();

        emit(TrandingMoviesLoadedState(trandingmovies: trandingMovies));
      } catch (e) {
        emit(TrandingMoviesErrorState(errorMessage: e.toString()));
      }
    });
  }
}
