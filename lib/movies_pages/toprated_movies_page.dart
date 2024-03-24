import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflex_app/bloc/toprated_movie_bloc/bloc/toprated_movies_bloc.dart';
import 'package:netflex_app/widget/error_widget/error.dart';
import 'package:netflex_app/widget/initial_widget/initial.dart';
import 'package:netflex_app/widget/loaded_widget/toprated_movie_loaded.dart';

import '../widget/loading_widget/loading.dart';

class TopratedMoviesPage extends StatefulWidget {
  const TopratedMoviesPage({super.key});

  @override
  State<TopratedMoviesPage> createState() => _TopratedMoviesPageState();
}

class _TopratedMoviesPageState extends State<TopratedMoviesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TopratedMoviesBloc>(context)
        .add(FatchTopratedMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopratedMoviesBloc, TopratedMoviesState>(
      bloc: BlocProvider.of<TopratedMoviesBloc>(context),
      builder: (context, state) {
        if (state is TopratedMoviesInitial) {
          return const InitialWidget();
        } else if (state is TopratedMoviesLodingState) {
          return const LoadingWidget();
        } else if (state is TopratedMoviesLoadedState) {
          return TopratedMoviesWidget(topratedMovies: state.topratedMovies);
        } else {
          return ErrorMessage(
              errorMessage: (state as TopratedMoviesErrorState).errorMessage);
        }
      },
    );
  }
}
