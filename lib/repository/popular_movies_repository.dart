import 'dart:convert';
import 'package:netflex_app/apibaseurl_and_apikey/baseurl.dart';
import 'package:netflex_app/apibaseurl_and_apikey/key.dart';
import 'package:netflex_app/models/popular_movies_models.dart';
import 'package:http/http.dart' as http;

class PopularMoviesApi {
  String trandingMoviesUrl = popularMoviesUrl + popularMoviesKey;
  Future<List<PopularMovies>> fatchPopularMoviesList() async {
    final reponse = await http.get(Uri.parse(trandingMoviesUrl));
    if (reponse.statusCode == 200) {
      final decodeData = json.decode(reponse.body)['results'] as List;
      return decodeData.map((map) => PopularMovies.fromMap(map)).toList();
    } else {
      throw Exception('some thing is wrong!');
    }
  }
}
