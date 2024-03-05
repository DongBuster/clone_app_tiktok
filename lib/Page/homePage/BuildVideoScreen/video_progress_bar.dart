import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../main.dart';

class VideoProgressBar extends StatefulWidget {
  final VideoPlayerController controller;
  const VideoProgressBar({super.key, required this.controller});

  @override
  State<VideoProgressBar> createState() => _VideoProgressBarState();
}

class _VideoProgressBarState extends State<VideoProgressBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Positioned(
      left: 0,
      bottom: 61,
      height: 6,
      width: mq.width,
      child: VideoProgressIndicator(
        allowScrubbing: true,
        widget.controller,
        colors: const VideoProgressColors(
            backgroundColor: Colors.white54, playedColor: Colors.white),
      ),
    );
  }
}
