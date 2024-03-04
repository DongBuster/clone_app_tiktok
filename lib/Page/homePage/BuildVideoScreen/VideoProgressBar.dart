import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../main.dart';

class VideoProgressBar extends StatefulWidget {
  late VideoPlayerController controller;
  VideoProgressBar({super.key, required this.controller});

  @override
  State<VideoProgressBar> createState() => _VideoProgressBarState();
}

class _VideoProgressBarState extends State<VideoProgressBar> {
  final double _currentSliderValue = 0.0;

  @override
  void initState() {
    // widget.controller.addListener(() {
    //   double pos = widget.controller.value.position.inSeconds.toDouble();
    //   setState(() {
    //     _sliderValue = pos;
    //   });
    //   if (pos >= widget.controller.value.position.inSeconds.toDouble()) {
    //     setState(() {
    //       widget.controller.pause();
    //       widget.controller.seekTo(Duration.zero);
    //     });
    //   }
    // });
    // widget.controller.addListener(() {
    //   setState(() {
    //     _currentSliderValue =
    //         widget.controller.value.position.inMilliseconds.toDouble();
    //   });
    // });
    super.initState();
  }

  void _onSeekTo(double seconds) {
    setState(() {
      widget.controller.seekTo(Duration(seconds: seconds.toInt()));
      widget.controller.play();
      print('width:${mq.width}');
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Positioned(
      left: 0,
      bottom: 61,
      height: 6,
      // right: 0,
      width: mq.width,
      child:
          // Container(
          //   width: mq.width,
          //   child: Slider(
          //     value: _currentSliderValue,
          //     min: 0.0,
          //     max: widget.controller.value.duration.inMilliseconds.toDouble(),
          //     onChanged: (value) {
          //       setState(() {
          //         _currentSliderValue = value;
          //       });
          //       widget.controller.seekTo(Duration(milliseconds: value.toInt()));
          //     },
          //     activeColor: Colors.blue,
          //     inactiveColor: Colors.grey,
          //     label: '${(_currentSliderValue / 1000).toStringAsFixed(1)}',
          //     // divisions:
          //     //     (widget.controller.value.duration.inMilliseconds.toDouble() /
          //     //             1000)
          //     //         .toInt(),
          //   ),
          // )
          // Slider(
          //   min: 0,
          //   max: widget.controller.value.duration.inSeconds.toDouble(),
          //   value: widget.controller.value.position.inSeconds.toDouble(),
          //   onChanged: _onSeekTo,
          //   thumbColor: Colors.white,
          //   activeColor: Colors.white,
          //   inactiveColor: Colors.white60,
          // )
          VideoProgressIndicator(
        allowScrubbing: true,
        widget.controller,
        colors: const VideoProgressColors(
            backgroundColor: Colors.white54, playedColor: Colors.white),
      ),
      //     LinearProgressIndicator(
      //   value: widget.controller.value.position.inSeconds.toDouble(),
      // )
    );
  }
}
