import 'package:flutter/material.dart';
import 'package:netflex_app/apibaseurl_and_apikey/key.dart';
import 'package:netflex_app/widget/box_decoration_widget/box_decoration.dart';
import 'package:netflex_app/widget/color_widget/colors.dart';
import 'package:netflex_app/widget/heigt_control_container/height_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<String> favoriteTitles = [];
  List<String> favoritePosterPath = [];

  @override
  void initState() {
    super.initState();
    fetchAndSetFavorites();
  }

  Future<void> fetchAndSetFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>>? favoriteMoviesData = [];
    List<String>? favoriteDataStrings =
        prefs.getStringList('favoriteMoviesData');

    if (favoriteDataStrings != null) {
      favoriteMoviesData = favoriteDataStrings
          .map((dataString) => jsonDecode(dataString))
          .cast<Map<String, dynamic>>()
          .toList();
      setState(() {
        favoriteTitles = favoriteMoviesData!
            .map((movieData) => movieData['titleName'])
            .toList()
            .cast();
        favoritePosterPath = favoriteMoviesData
            .map((movieData) => movieData['posterPath'])
            .toList()
            .cast();
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrondColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: backgrondColor,
        elevation: 0.3,
        centerTitle: true,
        title: const Text(
          'Favorite Movies',
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, color: Colors.pink),
        ),
      ),
      body: favoriteTitles.isEmpty
          ? const Center(
              child: Text(
                'No favorite movies yet!',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: favoriteTitles.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 20,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecorationWidget(),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: BoxDecorationWidget(),
                        height: calculateContainerHeight(context, 0.25),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              imageApi + favoritePosterPath[index],
                              fit: BoxFit.fill,
                            )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        favoriteTitles[index],
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
