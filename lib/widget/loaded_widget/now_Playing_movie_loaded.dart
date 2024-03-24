import 'package:flutter/material.dart';
import 'package:netflex_app/models/now_playing_movies_models.dart';
import 'package:netflex_app/widget/now_playing_listview_widget/now_playing_listview_item.dart';

class NowPalyingMoviesWidget extends StatelessWidget {
  const NowPalyingMoviesWidget({required this.nowPlayingMovies, super.key});
  final List<NowPlayingMovies> nowPlayingMovies;

  @override
  Widget build(BuildContext context) {
    return NowPlayingListviewItem(nowPlayingMovies: nowPlayingMovies);
  }
}
