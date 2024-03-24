import 'package:flutter/material.dart';
import 'package:netflex_app/models/tranding_movies_models.dart';
import 'package:netflex_app/widget/tranding_crouser_slider_widget/crouser_slider_screen.dart';

class TrandingMoviesLoadedWidget extends StatelessWidget {
  const TrandingMoviesLoadedWidget({required this.trandingMovies, super.key});
  final List<TrandingMovies> trandingMovies;

  @override
  Widget build(BuildContext context) {
    return CrouserSliderPage(trandingMovies: trandingMovies);
  }
}
