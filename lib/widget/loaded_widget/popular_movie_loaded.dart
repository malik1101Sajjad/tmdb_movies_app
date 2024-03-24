import 'package:flutter/material.dart';
import 'package:netflex_app/models/popular_movies_models.dart';
import 'package:netflex_app/widget/popular_listview_widget/popular_listview_item.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({required this.popularMovies, super.key});
  final List<PopularMovies> popularMovies;

  @override
  Widget build(BuildContext context) {
    return PopularListviewItem(popularMovies: popularMovies);
  }
}
