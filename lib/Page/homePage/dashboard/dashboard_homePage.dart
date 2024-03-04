import 'package:clone_app_tiktok/Animations/AnimationsPage.dart';
import 'package:clone_app_tiktok/BuildApp/HeaderApp.dart';
import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/ViewAllVideo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideTransitionScreen(
      child: const Stack(
        children: [
          ViewAllVideo(),
          HeaderApp(),
        ],
      ),
    );
  }
}
