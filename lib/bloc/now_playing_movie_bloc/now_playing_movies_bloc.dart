import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:netflex_app/models/now_playing_movies_models.dart';
import 'package:netflex_app/repository/now_playing_movies_repository.dart';

part 'now_playing_movies_event.dart';
part 'now_playing_movies_state.dart';

class NowPlayingMoviesBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  NowPlayingMoviesBloc() : super(NowPlayingMoviesInitial()) {
    on<NowPlayingMoviesEvent>((event, emit) async {
      emit(NowPlayingMoviesLodingState());
      try {
        var nowPlayingMovies =
            await NowPlayingMoviesApi().fatchNowPlayingMoviesList();
        emit(NowPlayingMoviesLoadedState(nowPlayingMovies: nowPlayingMovies));
      } catch (e) {
        emit(NowPlayingMoviesErrorState(errorMessage: e.toString()));
      }
    });
  }
}
