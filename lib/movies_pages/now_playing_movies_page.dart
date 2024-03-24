import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflex_app/bloc/now_playing_movie_bloc/now_playing_movies_bloc.dart';
import 'package:netflex_app/widget/initial_widget/initial.dart';
import 'package:netflex_app/widget/loaded_widget/now_Playing_movie_loaded.dart';
import 'package:netflex_app/widget/loading_widget/loading.dart';

import '../widget/error_widget/error.dart';

class NowPlayingMoviesPage extends StatefulWidget {
  const NowPlayingMoviesPage({super.key});

  @override
  State<NowPlayingMoviesPage> createState() => _NowPlayingMoviesPageState();
}

class _NowPlayingMoviesPageState extends State<NowPlayingMoviesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NowPlayingMoviesBloc>(context).add(FatchNowPlayingMoviesEvent());
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
      bloc: BlocProvider.of<NowPlayingMoviesBloc>(context),
      builder: (context, state) {
        if (state is NowPlayingMoviesInitial) {
          return const InitialWidget();
        } else if (state is NowPlayingMoviesLodingState) {
          return const LoadingWidget();
        } else if (state is NowPlayingMoviesLoadedState) {
          return NowPalyingMoviesWidget(
              nowPlayingMovies: state.nowPlayingMovies);
        } else {
          return ErrorMessage(
              errorMessage: (state as NowPlayingMoviesErrorState).errorMessage);
        }
      },
    );
  }
}
