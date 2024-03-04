import 'dart:async';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/Buttons/Buttons.dart';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/Description/VideoDescription.dart';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/VideoProgressBar.dart';
import 'package:clone_app_tiktok/Animations/HeartAnimation.dart';
import 'package:clone_app_tiktok/Route/App_Route.dart';
import 'package:clone_app_tiktok/main.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  VideoPlayerController controller;
  Video({super.key, required this.controller});

  //  = VideoPlayerController.network(
  //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');

  // required this.controller
  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  // late Future<void> _initializeVideoPlayerFuture;

  bool favorited = false;
  bool favorited_double = false;
  //
  bool isTilted = false;
  bool isplaying = true;
  //
  final List<Widget> _listIconHeart = [];
  //
  final keyText = GlobalKey();

  Offset? _tapPosition;
  void _getTapPosition(TapDownDetails details) async {
    final tapPosition = details.globalPosition;
    setState(() {
      _tapPosition = tapPosition;
    });
  }

  @override
  void dispose() {
    AppRoute.router.location != '/home' ? widget.controller.dispose() : null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.controller.play();
    widget.controller.setLooping(true);
  }

  @override
  build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: mq.width,
          height: mq.height,
          child: AspectRatio(
            aspectRatio: widget.controller.value.aspectRatio,
            // Use the VideoPlayer to display the video.
            child: VideoPlayer(widget.controller),
          ),
        ),

        // handles play, pause video ; heart animation when clicked screen
        GestureDetector(
          key: keyText,
          onTap: () {
            setState(() {
              isplaying = !isplaying;
              if (isplaying == true) {
                widget.controller.play();
              } else {
                widget.controller.pause();
              }
              debugPrint("$isplaying");
            });
          },
          onDoubleTapDown: (TapDownDetails details) {
            _getTapPosition(details);
            setState(() {
              favorited_double = true;
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
                isFavorite: favorited_double,
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
        VideoProgressBar(controller: widget.controller),
        const VideoDescription()
      ],
    );
  }
}
