import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class ButtonBookmark extends StatelessWidget {
  const ButtonBookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      LikeButton(
          isLiked: false,
          size: 40,
          circleColor: const CircleColor(
              start: Color(0xFFFFD200), end: Color(0xFFFFD200)),
          bubblesColor: const BubblesColor(
            dotPrimaryColor: Color(0xFFFFD200),
            dotSecondaryColor: Color(0xFFFFD200),
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.bookmark,
              color: isLiked ? Colors.yellowAccent : Colors.white,
              size: 30,
            );
          }),
      const Text(
        '929',
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
      )
    ]);
  }
}
