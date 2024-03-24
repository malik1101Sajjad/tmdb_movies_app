import 'package:flutter/material.dart';
import 'package:netflex_app/apibaseurl_and_apikey/key.dart';
import 'package:netflex_app/models/popular_movies_models.dart';
import 'package:netflex_app/navigation/navigation_widget.dart';
import 'package:netflex_app/screen/show_data%20sacreen.dart';
import 'package:netflex_app/widget/box_decoration_widget/box_decoration.dart';

class PopularListviewItem extends StatelessWidget {
  const PopularListviewItem({required this.popularMovies, super.key});
  final List<PopularMovies> popularMovies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: popularMovies.length,
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
                    posterPath: popularMovies[index].poster_path,
                    moviestitle: popularMovies[index].title,
                    rating: popularMovies[index].vote_average,
                    overview: popularMovies[index].overview,
                    releasedate: popularMovies[index].release_date,
                    id: popularMovies[index].id,
                  )));
                },
                child: Image.network(
                  imageApi + popularMovies[index].poster_path.toString(),
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
