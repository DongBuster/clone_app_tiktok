import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class ButtonFavorites extends StatelessWidget {
  bool favorited;
  ButtonFavorites({super.key, required this.favorited});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      LikeButton(
        isLiked: favorited,
        size: 45,
        circleColor:
            const CircleColor(start: Color(0xFFFF0047), end: Color(0xFFFF0047)),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: Color(0xFFFF0047),
          dotSecondaryColor: Color(0xFFFF0047),
        ),
        likeBuilder: (bool isLiked) {
          debugPrint('$isLiked');

          return Icon(
            Icons.favorite,
            color: isLiked ? Colors.redAccent : Colors.white,
            size: 35,
          );
        },
        onTap: (bool isLiked) {
          favorited = !favorited;
          isLiked = !isLiked;
          return Future.value(isLiked);
        },
      ),
      // const SizedBox(height: 5),
      const Text(
        '1M',
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
      )
    ]);
  }
}
