import 'package:flutter/material.dart';
import 'package:netflex_app/apibaseurl_and_apikey/key.dart';
import 'package:netflex_app/models/now_playing_movies_models.dart';
import 'package:netflex_app/navigation/navigation_widget.dart';
import 'package:netflex_app/screen/show_data%20sacreen.dart';
import 'package:netflex_app/widget/box_decoration_widget/box_decoration.dart';

class NowPlayingListviewItem extends StatelessWidget {
  const NowPlayingListviewItem({required this.nowPlayingMovies, super.key});
  final List<NowPlayingMovies> nowPlayingMovies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: nowPlayingMovies.length,
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
                    posterPath: nowPlayingMovies[index].poster_path,
                    moviestitle: nowPlayingMovies[index].title,
                    rating: nowPlayingMovies[index].vote_average,
                    overview: nowPlayingMovies[index].overview,
                    releasedate: nowPlayingMovies[index].release_date,
                    id: nowPlayingMovies[index].id,
                  )));
                },
                child: Hero(
                  tag: 'ABC${nowPlayingMovies[index].poster_path}',
                  child: Image.network(
                    imageApi + nowPlayingMovies[index].poster_path.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
