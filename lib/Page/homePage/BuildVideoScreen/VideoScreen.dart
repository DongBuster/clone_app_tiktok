import 'dart:async';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/Buttons/Buttons.dart';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/Description/VideoDescription.dart';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/VideoProgressBar.dart';
import 'package:clone_app_tiktok/Animations/HeartAnimation.dart';
import 'package:clone_app_tiktok/common/loading_indicator.dart';
import 'package:clone_app_tiktok/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  String linkVideo;
  String username;
  String description;
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
    // AppRoute.router.location != '/home'
    //     ? _videoPlayerController.dispose()
    //     : null;
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
    super.initState();
    _videoPlayerController.play();
    _videoPlayerController.setLooping(true);
  }

  @override
  build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Stack(
      children: [
        const ThreeBallIndicator(),
        SizedBox(
          width: mq.width,
          height: mq.height,
          child: AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            // Use the VideoPlayer to display the video.
            child: VideoPlayer(_videoPlayerController),
          ),
        ),

        // handles play, pause video ; heart animation when clicked screen
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
        VideoProgressBar(controller: _videoPlayerController),
        VideoDescription(
          username: widget.username,
          description: widget.description,
        )
      ],
    );
  }
}
