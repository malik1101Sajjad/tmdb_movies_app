import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflex_app/screen/play_tralier_screen.dart';
import 'package:netflex_app/widget/box_decoration_widget/box_decoration.dart';
import 'package:netflex_app/widget/heigt_control_container/height_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../apibaseurl_and_apikey/key.dart';

class DataClass extends StatefulWidget {
  const DataClass(
      {required this.posterPath,
      required this.moviestitle,
      required this.rating,
      required this.overview,
      required this.releasedate,
      required this.id,
      super.key});
  final String posterPath;
  final String moviestitle;
  final double rating;
  final String overview;
  final String? releasedate;
  final int? id;

  @override
  State<DataClass> createState() => _DataClassState();
}

class _DataClassState extends State<DataClass> {
  late bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    checkFavorite();
  }

  void checkFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = prefs.getBool(widget.id.toString()) ?? false;
    });
  }

  void toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = !isFavorite;
      prefs.setBool(widget.id.toString(), isFavorite);
      addToFavorites();
    });
  }

  void addToFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> existingFavorites = prefs
            .getStringList('favoriteMoviesData')
            ?.map((e) => Map<String, dynamic>.from(jsonDecode(e)))
            .toList() ??
        [];

    // Check if the movie is already in favorites
    bool alreadyExists =
        existingFavorites.any((movie) => movie['id'] == widget.id.toString());

    if (!alreadyExists) {
      // If the movie is not already in favorites, add it
      Map<String, dynamic> newFavorite = {
        'id': widget.id.toString(),
        'posterPath': widget.posterPath,
        'titleName': widget.moviestitle,
      };

      existingFavorites.add(newFavorite);

      prefs.setStringList('favoriteMoviesData',
          existingFavorites.map((e) => jsonEncode(e)).toList());

      setState(() {
        isFavorite = true;
      });
    } else {
      // If the movie is already in favorites, remove it
      existingFavorites
          .removeWhere((movie) => movie['id'] == widget.id.toString());

      prefs.setStringList('favoriteMoviesData',
          existingFavorites.map((e) => jsonEncode(e)).toList());

      setState(() {
        isFavorite = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.1),
        elevation: 0.3,
        title: Text(widget.moviestitle.toString(),
            style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.pink),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              toggleFavorite();
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.pink),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                child: Container(
              width: double.infinity,
              height: calculateContainerHeight(context, 1),
              decoration: const BoxDecoration(color: Colors.orange),
              child: ClipRRect(
                child: Image.network(
                  imageApi + widget.posterPath.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            )),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.6)),
                )),
            Positioned(
                top: 150,
                left: 20,
                right: 20,
                child: Container(
                  alignment: Alignment.center,
                  height: calculateContainerHeight(context, 0.7),
                  decoration: BoxDecorationWidget(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 20, left: 20),
                              padding: const EdgeInsets.all(3),
                              height: calculateContainerHeight(context, 0.25),
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecorationWidget(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Hero(
                                  tag: 'ABC${widget.posterPath.hashCode}',
                                  child: Image.network(
                                    imageApi + widget.posterPath.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 20),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecorationWidget(),
                                    child: Text(
                                      widget.moviestitle.toString(),
                                      style: const TextStyle(
                                          color: Colors.pink,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecorationWidget(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            widget.rating.toString(),
                                            textAlign: TextAlign.end,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Expanded(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.pink,
                                              size: 18,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: calculateContainerHeight(context, 0.2),
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecorationWidget(),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                      top: 12, bottom: 12),
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecorationWidget(),
                                  child: const Text(
                                    'Overview',
                                    style: TextStyle(
                                        color: Colors.pink,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Text(
                                widget.overview.toString(),
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin:
                            const EdgeInsets.only(left: 20, top: 20, right: 20),
                        decoration: BoxDecorationWidget(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Flexible(
                              child: Text('Release Date : ',
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Flexible(
                              child: Text(widget.releasedate ?? 'Not Date',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PlayVedio(id: widget.id)));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          decoration: BoxDecorationWidget(),
                          child: const Text('View Trailers',
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
