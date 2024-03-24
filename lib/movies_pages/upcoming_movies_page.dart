import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflex_app/bloc/upcoming_movie_bloc/bloc/upcoming_movies_bloc.dart';
import 'package:netflex_app/widget/error_widget/error.dart';
import 'package:netflex_app/widget/initial_widget/initial.dart';
import 'package:netflex_app/widget/loaded_widget/upcoming_movie_loades.dart';

import '../widget/loading_widget/loading.dart';

class UpcomingMoviesPage extends StatefulWidget {
  const UpcomingMoviesPage({super.key});

  @override
  State<UpcomingMoviesPage> createState() => _UpcomingMoviesPageState();
}

class _UpcomingMoviesPageState extends State<UpcomingMoviesPage> {
  @override
  void initState() {
    super.initState();
    context.read<UpcomingMoviesBloc>().add(FatchUpcomingMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
      bloc: context.read<UpcomingMoviesBloc>(),
      builder: (context, state) {
        if (state is UpcomingMoviesInitial) {
          return const InitialWidget();
        } else if (state is UpcomingMoviesLodingState) {
          return const LoadingWidget();
        } else if (state is UpcomingMoviesLoadedState) {
          return UpcomingMoviesWidget(upcomingMovies: state.upcomingMovies);
        } else {
          return ErrorMessage(errorMessage: (state as UpcomingMoviesErrorState).errorMessage);
        }
      },
    );
  }
}
