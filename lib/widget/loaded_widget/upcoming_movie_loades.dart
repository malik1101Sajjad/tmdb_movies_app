import 'package:flutter/material.dart';
import 'package:netflex_app/models/upcoming_movies_models.dart';
import 'package:netflex_app/widget/upcoming_listview_widget/upcoming_listview_item.dart';

class UpcomingMoviesWidget extends StatelessWidget {
  const UpcomingMoviesWidget({required this.upcomingMovies, super.key});
  final List<UpcomingMovies> upcomingMovies;

  @override
  Widget build(BuildContext context) {
    return UpcomingListviewItem(upcomingMovies: upcomingMovies);
  }
}
