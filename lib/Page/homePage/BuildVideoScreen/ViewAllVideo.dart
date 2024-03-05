import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/VideoScreen.dart';
import 'package:clone_app_tiktok/common/loading_indicator.dart';
import 'package:clone_app_tiktok/main.dart';
import 'package:clone_app_tiktok/model/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:video_player/video_player.dart';
// import 'package:firebase_database/firebase_database.dart';

class ViewAllVideo extends StatefulWidget {
  const ViewAllVideo({
    super.key,
  });

  @override
  State<ViewAllVideo> createState() => _ViewAllVideoState();
}

class _ViewAllVideoState extends State<ViewAllVideo> {
  final PageController pageController = PageController();
  final videos = Supabase.instance.client.from('videos').select();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    // print(ref);

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: videos,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ThreeBallIndicator();
        }
        final countries = snapshot.data!;
        // print(countries.length);

        return PageView.builder(
          itemCount: countries.length,
          scrollDirection: Axis.vertical,
          controller: pageController,
          itemBuilder: (context, index) {
            return Video(
              linkVideo: countries[index]['linkvideo'],
              username: countries[index]['username'],
              description: countries[index]['description'],
            );
          },
        );
      },
    );
  }
}
