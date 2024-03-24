import 'package:flutter/material.dart';
import 'package:netflex_app/widget/box_decoration_widget/box_decoration.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LazyLoadYoutubePlayer extends StatefulWidget {
  final String trailerKey;

  const LazyLoadYoutubePlayer({Key? key, required this.trailerKey})
      : super(key: key);

  @override
  _LazyLoadYoutubePlayerState createState() => _LazyLoadYoutubePlayerState();
}

class _LazyLoadYoutubePlayerState extends State<LazyLoadYoutubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.trailerKey,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecorationWidget(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.pink,
        ),
      ),
    );
  }
}
