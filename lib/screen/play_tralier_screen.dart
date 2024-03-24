import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflex_app/widget/color_widget/colors.dart';
import 'package:netflex_app/widget/lazy_loading_youtobe_player/lazy_load_youtube.dart';

class PlayVedio extends StatefulWidget {
  const PlayVedio({required this.id, super.key});
  final int? id;

  @override
  State<PlayVedio> createState() => _PlayVedioState();
}

class _PlayVedioState extends State<PlayVedio> {
  late Future<Map<String, dynamic>> _fetchMovieDetails;

  @override
  void initState() {
    super.initState();
    _fetchMovieDetails = _fetchMovieDetailsFromApi(widget.id!);
  }

  Future<Map<String, dynamic>> _fetchMovieDetailsFromApi(int movieId) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=34b82fad99f412732cfe989686a21af1&append_to_response=videos'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgrondColor,
        elevation: 0.3,
        title: const Text('Videos',
            style: TextStyle(
                color: Colors.pink, fontSize: 13, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.pink),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: backgrondColor,
      body: FutureBuilder(
        future: _fetchMovieDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.pink,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<dynamic> trailers = snapshot.data!['videos']['results'];
            return ListView.builder(
              itemCount: trailers.length,
              itemBuilder: (context, index) {
                final trailerKey = trailers[index]['key'];
                return LazyLoadYoutubePlayer(trailerKey: trailerKey);
              },
            );
          }
        },
      ),
    );
  }
}
