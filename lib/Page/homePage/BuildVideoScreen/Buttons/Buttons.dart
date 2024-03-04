import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/Buttons/ButtonBookmark.dart';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/Buttons/ButtonComment.dart';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/Buttons/ButtonFavorites.dart';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/Buttons/ButtonShare.dart';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/Buttons/MusicDisc.dart';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/Buttons/User_Client.dart';
import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  bool favorited;
  bool isplaying;
  Buttons({super.key, required this.favorited, required this.isplaying});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  final bool _isVisible = false;

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
