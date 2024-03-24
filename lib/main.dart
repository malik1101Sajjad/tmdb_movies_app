import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflex_app/bloc/now_playing_movie_bloc/now_playing_movies_bloc.dart';
import 'package:netflex_app/bloc/popular_movie_bloc/bloc/popular_movies_bloc.dart';
import 'package:netflex_app/bloc/toprated_movie_bloc/bloc/toprated_movies_bloc.dart';
import 'package:netflex_app/bloc/tranding_movie_bloc/tranding_movies_bloc.dart';
import 'package:netflex_app/bloc/upcoming_movie_bloc/bloc/upcoming_movies_bloc.dart';
import 'package:netflex_app/screen/bottom_bar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<TrandingMoviesBloc>(
            create: (context) => TrandingMoviesBloc()),
        BlocProvider<NowPlayingMoviesBloc>(
            create: (context) => NowPlayingMoviesBloc()),
        BlocProvider<UpcomingMoviesBloc>(
            create: (context) => UpcomingMoviesBloc()),
        BlocProvider<PopularMoviesBloc>(
            create: (context) => PopularMoviesBloc()),
        BlocProvider<TopratedMoviesBloc>(
            create: (context) => TopratedMoviesBloc()),
      ], child: const BottomPage()),
    );
  }
}
