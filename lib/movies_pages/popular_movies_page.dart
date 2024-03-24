import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflex_app/bloc/popular_movie_bloc/bloc/popular_movies_bloc.dart';
import 'package:netflex_app/widget/error_widget/error.dart';
import 'package:netflex_app/widget/initial_widget/initial.dart';
import 'package:netflex_app/widget/loaded_widget/popular_movie_loaded.dart';

import '../widget/loading_widget/loading.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();
    context.read<PopularMoviesBloc>().add(FatchPopularMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      bloc: context.read<PopularMoviesBloc>(),
      builder: (context, state) {
        if (state is PopularMoviesInitial) {
          return const InitialWidget();
        } else if (state is PopularMoviesLodingState) {
          return const LoadingWidget();
        } else if (state is PopularMoviesLoadedState) {
          return PopularMoviesWidget(popularMovies: state.popularMovies);
        } else {
          return ErrorMessage(errorMessage: (state as PopularMoviesErrorState).errorMessage);
        }
      },
    );
  }
}
