import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflex_app/apibaseurl_and_apikey/key.dart';
import 'package:netflex_app/models/tranding_movies_models.dart';
import 'package:netflex_app/navigation/navigation_widget.dart';
import 'package:netflex_app/screen/show_data%20sacreen.dart';
import 'package:netflex_app/widget/box_decoration_widget/box_decoration.dart';
import 'package:netflex_app/widget/color_widget/colors.dart';
import 'package:netflex_app/widget/heigt_control_container/height_container.dart';

class CrouserSliderPage extends StatefulWidget {
  const CrouserSliderPage({required this.trandingMovies, super.key});
  final List<TrandingMovies> trandingMovies;

  @override
  State<CrouserSliderPage> createState() => _CrouserSliderPageState();
}

class _CrouserSliderPageState extends State<CrouserSliderPage> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: CarouselSlider(
                items: widget.trandingMovies
                    .map((e) => Container(
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.all(3),
                          width: double.infinity,
                          height: calculateContainerHeight(context, 0.4),
                          decoration: BoxDecorationWidget(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(NavigationPage(
                                    child: DataClass(
                                        posterPath: e.poster_path,
                                        moviestitle: e.title,
                                        rating: e.vote_average,
                                        overview: e.overview,
                                        releasedate: e.release_date,
                                        id: e.id)));
                              },
                              child: Image.network(
                                imageApi + e.poster_path,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                )),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.trandingMovies.asMap().entries.map((entry) {
              return Flexible(
                child: GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: AnimatedContainer(  
                    duration: const Duration(milliseconds: 500),
                    width: currentIndex == entry.key
                        ? MediaQuery.of(context).size.width * 0.03
                        : MediaQuery.of(context).size.width * 0.02,
                    height: MediaQuery.of(context).size.width * 0.02,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentIndex == entry.key
                            ? Colors.pink
                            : backgrondColor,
                        boxShadow: [
                          BoxShadow(
                              color: shadowBotomColor,
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(1, 1)),
                          BoxShadow(
                              color: shadowtopColor,
                              spreadRadius: 0.5,
                              blurRadius: 1,
                              offset: const Offset(-1, -1)),
                        ]),
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
