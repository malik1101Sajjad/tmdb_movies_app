import 'package:flutter/material.dart';
import 'package:netflex_app/apibaseurl_and_apikey/key.dart';
import 'package:netflex_app/models/toprated_movies_models.dart';
import 'package:netflex_app/navigation/navigation_widget.dart';
import 'package:netflex_app/screen/show_data%20sacreen.dart';
import 'package:netflex_app/widget/box_decoration_widget/box_decoration.dart';

class TopratedListviewItem extends StatelessWidget {
  const TopratedListviewItem({required this.topratedMovies, super.key});
  final List<TopratedMovies> topratedMovies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: topratedMovies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(3),
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecorationWidget(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(NavigationPage(
                      child: DataClass(
                    posterPath: topratedMovies[index].poster_path,
                    moviestitle: topratedMovies[index].title,
                    rating: topratedMovies[index].vote_average,
                    overview: topratedMovies[index].overview,
                    releasedate: topratedMovies[index].release_date,
                    id: topratedMovies[index].id,
                  )));
                },
                child: Image.network(
                  imageApi + topratedMovies[index].poster_path.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
