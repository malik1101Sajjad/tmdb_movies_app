import 'package:flutter/material.dart';
import 'package:netflex_app/movies_pages/now_playing_movies_page.dart';
import 'package:netflex_app/movies_pages/popular_movies_page.dart';
import 'package:netflex_app/movies_pages/toprated_movies_page.dart';
import 'package:netflex_app/movies_pages/tranding_movies_page.dart';
import 'package:netflex_app/movies_pages/upcoming_movies_page.dart';
import 'package:netflex_app/repository/tranding_movies_repository.dart';
import 'package:netflex_app/widget/color_widget/colors.dart';
import 'package:netflex_app/widget/container_widget/container.dart';
import 'package:netflex_app/widget/heigt_control_container/height_container.dart';
import 'package:netflex_app/widget/list_tile_widget/list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCheck = false;
  TrandingMoviesApi trandingMoviesApi = TrandingMoviesApi();
  void theamdata() {
    setState(() {
      isCheck = !isCheck; // Toggle the boolean value

      // Set colors based on the updated boolean value
      backgrondColor = isCheck ? Colors.grey.shade900 : Colors.grey.shade300;
      shadowBotomColor = isCheck ? Colors.black : Colors.grey.shade500;
      shadowtopColor = isCheck ? Colors.grey.shade500 : Colors.white;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: backgrondColor,
            title: const Text('Netflex',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(isCheck ? Icons.color_lens : Icons.color_lens_outlined,
                  color: Colors.pink),
              onPressed: () {
                theamdata();
              },
            )),
        backgroundColor: backgrondColor,
        body: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 20,
            ),
            const TrandingMoviesPage(),
            const SizedBox(height: 5),
            ContainerWidget(
                height: calculateContainerHeight(context, 0.4),
                key: null,
                child: Column(
                  children: [
                    ListTileWidget(
                        moviesListName: 'Now Playing', context: context),
                    const NowPlayingMoviesPage()
                  ],
                )),
            ContainerWidget(
                height: calculateContainerHeight(context, 0.4),
                key: null,
                child: Column(
                  children: [
                    ListTileWidget(
                        moviesListName: 'Upcoming', context: context),
                    const UpcomingMoviesPage()
                  ],
                )),
            ContainerWidget(
                height: calculateContainerHeight(context, 0.4),
                key: null,
                child: Column(
                  children: [
                    ListTileWidget(moviesListName: 'Popular', context: context),
                    const PopularMoviesPage()
                  ],
                )),
            ContainerWidget(
                height: calculateContainerHeight(context, 0.4),
                key: null,
                child: Column(
                  children: [
                    ListTileWidget(
                        moviesListName: 'TopRated', context: context),
                    const TopratedMoviesPage()
                  ],
                )),
            const SizedBox(height: 30)
          ],
        ));
  }
}
