import 'package:flutter/material.dart';
import 'Widget/User_Client.dart';
import 'Widget/button_bookmark.dart';
import 'Widget/button_comment.dart';
import 'Widget/button_favorites.dart';
import 'Widget/button_share.dart';
import 'Widget/music-disc.dart';

class Buttons extends StatefulWidget {
  final bool favorited;
  final bool isplaying;
  const Buttons({super.key, required this.favorited, required this.isplaying});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 5,
        bottom: 65,
        width: 70,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // image users
            const UserClient(),
            const SizedBox(height: 15),

            // icon favorites
            ButtonFavorites(favorited: widget.favorited),
            const SizedBox(height: 15),

            //icon messages
            const ButtonComment(),
            const SizedBox(height: 15),

            // icon bookmark
            const ButtonBookmark(),
            const SizedBox(height: 15),

            // icon share
            const ButtonShare(),
            const SizedBox(height: 15),

            // music disc
            MusicDisc(
              isplaying: widget.isplaying,
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}
