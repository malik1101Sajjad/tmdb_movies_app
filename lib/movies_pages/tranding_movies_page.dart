import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflex_app/bloc/tranding_movie_bloc/tranding_movies_bloc.dart';
import 'package:netflex_app/widget/initial_widget/initial.dart';
import 'package:netflex_app/widget/loading_widget/loading.dart';

import '../widget/error_widget/error.dart';
import '../widget/loaded_widget/tranding_movie_loaded.dart';

class TrandingMoviesPage extends StatefulWidget {
  const TrandingMoviesPage({super.key});

  @override
  State<TrandingMoviesPage> createState() => _TrandingMoviesPageState();
}

class _TrandingMoviesPageState extends State<TrandingMoviesPage> {
  @override
  void initState() {
    super.initState();
    context.read<TrandingMoviesBloc>().add(FatchTrandingMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrandingMoviesBloc, TrandingMoviesState>(
      bloc: context.read<TrandingMoviesBloc>(),
      builder: (context, state) {
        if (state is TrandingMoviesInitial) {
          return const InitialWidget();
        } else if (state is TrandingMoviesLodingState) {
          return const LoadingWidget();
        } else if (state is TrandingMoviesLoadedState) {
          return TrandingMoviesLoadedWidget(
              trandingMovies: state.trandingmovies);
        } else {
          return ErrorMessage(errorMessage: (state as TrandingMoviesErrorState).errorMessage);
        }
      },
    );
  }
}
