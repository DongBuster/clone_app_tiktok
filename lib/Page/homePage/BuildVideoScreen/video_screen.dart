import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../Animations/heart_animation.dart';
import '../../../common/loading_indicator.dart';
import '../../../main.dart';
import '../../../utils/export.dart';

class Video extends StatefulWidget {
  final String linkVideo;
  final String username;
  final String description;
  Video(
      {super.key,
      required this.linkVideo,
      required this.username,
      required this.description});

  //  = VideoPlayerController.network(
  //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');

  // required this.controller
  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _videoPlayerController;

  bool favorited = false;
  bool favoritedDouble = false;
  //
  bool isTilted = false;
  bool isplaying = true;
  //
  final List<Widget> _listIconHeart = [];
  //
  final keyText = GlobalKey();

  // get position when ontap screen
  Offset? _tapPosition;
  void _getTapPosition(TapDownDetails details) async {
    final tapPosition = details.globalPosition;
    setState(() {
      _tapPosition = tapPosition;
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.linkVideo))
          ..initialize().then((_) {
            setState(() {});
          });
    _videoPlayerController.play();
    _videoPlayerController.setLooping(true);
    super.initState();
  }

  @override
  build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Stack(
      children: [
        // screen loading
        const ThreeBallIndicator(),
        // screen play video
        SizedBox(
          width: mq.width,
          height: mq.height,
          child: AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController),
          ),
        ),

        // handles play, pause video , heart animation when clicked screen
        GestureDetector(
          key: keyText,
          onTap: () {
            setState(() {
              isplaying = !isplaying;
              if (isplaying == true) {
                _videoPlayerController.play();
              } else {
                _videoPlayerController.pause();
              }
              debugPrint("$isplaying");
            });
          },
          onDoubleTapDown: (TapDownDetails details) {
            _getTapPosition(details);
            setState(() {
              favoritedDouble = true;
              isTilted = !isTilted;
              favorited = true;

              Timer(const Duration(seconds: 1), () {
                setState(() {
                  _listIconHeart.removeAt(0);
                });
              });
              // debugPrint('${_tapPosition!.dx}');
              // debugPrint('${_tapPosition!.dy}');
              // debugPrint('${mq.width}');
              // debugPrint('${mq.height}');
              _listIconHeart.add(HeartAnimation(
                isFavorite: favoritedDouble,
                isTilted: isTilted,
                top: _tapPosition!.dy,
                left: _tapPosition!.dx,
              ));
            });
          },
        ),

        // list icons heart
        ..._listIconHeart,
        // handle icon pause video
        isplaying
            ? const SizedBox()
            : const Center(
                child: Icon(
                  Icons.play_arrow,
                  size: 50,
                  color: Colors.white38,
                ),
              ),
        // contents right

        Buttons(favorited: favorited, isplaying: isplaying),
        // video progress bar
        VideoProgressBar(controller: _videoPlayerController),
        VideoDescription(
          username: widget.username,
          description: widget.description,
        )
      ],
    );
  }
}
