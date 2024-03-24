import 'package:flutter/material.dart';
import 'package:netflex_app/models/toprated_movies_models.dart';
import 'package:netflex_app/widget/toprated_listview_widget/toprated_listview_item.dart';

class TopratedMoviesWidget extends StatelessWidget {
  const TopratedMoviesWidget({required this.topratedMovies, super.key});
  final List<TopratedMovies> topratedMovies;

  @override
  Widget build(BuildContext context) {
    return TopratedListviewItem(topratedMovies: topratedMovies);
  }
}
