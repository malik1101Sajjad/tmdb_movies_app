import 'dart:convert';
import 'package:netflex_app/apibaseurl_and_apikey/baseurl.dart';
import 'package:netflex_app/apibaseurl_and_apikey/key.dart';
import 'package:netflex_app/models/tranding_movies_models.dart';
import 'package:http/http.dart' as http;

class TrandingMoviesApi {
  String trandingMoviesUrl = trandingMoviesBaseUrl + trandingMoviesKey;
  Future<List<TrandingMovies>> fatchTrandingMoviesList() async {
    final reponse = await http.get(Uri.parse(trandingMoviesUrl));
    if (reponse.statusCode == 200) {
      final decodeData = json.decode(reponse.body)['results'] as List;
      return decodeData.map((map) => TrandingMovies.fromMap(map)).toList();
    } else {
      throw Exception('some thing is wrong!');
    }
  }
}
