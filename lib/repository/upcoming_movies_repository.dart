import 'dart:convert';
import 'package:netflex_app/apibaseurl_and_apikey/baseurl.dart';
import 'package:netflex_app/apibaseurl_and_apikey/key.dart';
import 'package:netflex_app/models/upcoming_movies_models.dart';
import 'package:http/http.dart' as http;

class UpcomingMoviesApi {
  String trandingMoviesUrl = upcomingMoviesUrl + upcomingMoviesKey;
  Future<List<UpcomingMovies>> fatchUpcomingMoviesList() async {
    final reponse = await http.get(Uri.parse(trandingMoviesUrl));
    if (reponse.statusCode == 200) {
      final decodeData = json.decode(reponse.body)['results'] as List;
      return decodeData.map((map) => UpcomingMovies.fromMap(map)).toList();
    } else {
      throw Exception('some thing is wrong!');
    }
  }
}
