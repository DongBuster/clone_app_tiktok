import 'package:flutter/material.dart';

import 'expandable_text.dart';

class VideoDescription extends StatefulWidget {
  final String username;
  final String description;
  const VideoDescription({
    super.key,
    required this.username,
    required this.description,
  });

  @override
  State<VideoDescription> createState() => _VideoDescriptionState();
}

class _VideoDescriptionState extends State<VideoDescription> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80,
      left: 10,
      child: TextContentVideo(
        title: widget.username,
        textDescription: widget.description,
        nameMusic: '♫ Saleall Âm thanh Gốc',
      ),
    );
  }
}
