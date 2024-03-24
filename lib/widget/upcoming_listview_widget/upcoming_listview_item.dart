import 'package:flutter/material.dart';
import 'package:netflex_app/apibaseurl_and_apikey/key.dart';
import 'package:netflex_app/models/upcoming_movies_models.dart';
import 'package:netflex_app/navigation/navigation_widget.dart';
import 'package:netflex_app/screen/show_data%20sacreen.dart';
import 'package:netflex_app/widget/box_decoration_widget/box_decoration.dart';

class UpcomingListviewItem extends StatelessWidget {
  const UpcomingListviewItem({required this.upcomingMovies, super.key});
  final List<UpcomingMovies> upcomingMovies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: upcomingMovies.length,
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
                    posterPath: upcomingMovies[index].poster_path,
                    moviestitle: upcomingMovies[index].title,
                    rating: upcomingMovies[index].vote_average,
                    overview: upcomingMovies[index].overview,
                    releasedate:upcomingMovies[index].release_date,
                    id: upcomingMovies[index].id,
                  )));
                },
                child: Image.network(
                  imageApi + upcomingMovies[index].poster_path.toString(),
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
