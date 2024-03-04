import 'package:clone_app_tiktok/Page/homePage/BuildVideoScreen/VideoScreen.dart';
import 'package:clone_app_tiktok/main.dart';
import 'package:flutter/material.dart';
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

  // FirebaseDatabase database = FirebaseDatabase.instance;
  // DatabaseReference ref = FirebaseDatabase.instance.ref();

  final List<String> videoAssets = [
    'assets/video/1.mp4',
    'assets/video/2.mp4',
    'assets/video/3.mp4',
    'assets/video/4.mp4',
  ];

  Future<VideoPlayerController> initializeVideoController(
      String videoAssetPath) async {
    var controller = VideoPlayerController.asset(videoAssetPath);
    await controller.initialize();
    return controller;
  }

  final List<Future<VideoPlayerController>> videoControllerFutures = [];
  Future<void> loadVideoControllers() async {
    for (final assetPath in videoAssets) {
      videoControllerFutures.add(initializeVideoController(assetPath));
    }
  }

  @override
  void dispose() {
    // videoControllers.map((e) => e.dispose());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadVideoControllers();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    // print(ref);

    return PageView.builder(
      itemCount: videoAssets.length,
      scrollDirection: Axis.vertical,
      controller: pageController,
      itemBuilder: (context, index) {
        return FutureBuilder<VideoPlayerController>(
          future: videoControllerFutures[index],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Video(controller: snapshot.data!);
            } else {
              return const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        );
      },
    );
  }
}
