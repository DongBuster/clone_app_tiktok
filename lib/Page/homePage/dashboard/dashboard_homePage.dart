import 'package:flutter/material.dart';

import '../../../Animations/animations_page.dart';
import '../../../BuildApp/header_app.dart';
import '../BuildVideoScreen/view_all_video.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SlideTransitionScreen(
      child: Stack(
        children: [
          ViewAllVideo(),
          HeaderApp(),
        ],
      ),
    );
  }
}
