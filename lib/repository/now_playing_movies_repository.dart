import 'dart:convert';
import 'package:netflex_app/apibaseurl_and_apikey/baseurl.dart';
import 'package:netflex_app/apibaseurl_and_apikey/key.dart';
import 'package:netflex_app/models/now_playing_movies_models.dart';
import 'package:http/http.dart' as http;

class NowPlayingMoviesApi {
  String trandingMoviesUrl = nowPlayingMoviesUrl + nowPlayingMoviesKey;
  Future<List<NowPlayingMovies>> fatchNowPlayingMoviesList() async {
    final reponse = await http.get(Uri.parse(trandingMoviesUrl));
    if (reponse.statusCode == 200) {
      final decodeData = json.decode(reponse.body)['results'] as List;
      return decodeData.map((map) => NowPlayingMovies.fromMap(map)).toList();
    } else {
      throw Exception('some thing is wrong!');
    }
  }
}
