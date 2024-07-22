import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:video_player/video_player.dart';
import '../../../common/loading_indicator.dart';
import '../../../main.dart';
import '../../../utils/export.dart';

class ViewAllVideo extends StatefulWidget {
  const ViewAllVideo({
    super.key,
  });

  @override
  State<ViewAllVideo> createState() => _ViewAllVideoState();
}

class _ViewAllVideoState extends State<ViewAllVideo> {
  final videos = Supabase.instance.client.from('videos').select();
  List<VideoPlayerController> controllerVideos = [];

  @override
  void dispose() {
    if (controllerVideos.isNotEmpty) {
      for (var i = 0; i < controllerVideos.length; i++) {
        controllerVideos[i].pause();
      }
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future initVideoController(String url, int initIndex) async {
    var controller = VideoPlayerController.networkUrl(Uri.parse(url));
    controllerVideos.add(controller);
    await controllerVideos[initIndex].initialize();
    await controllerVideos[initIndex].setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: videos,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ThreeBallIndicator();
        }
        final countries = snapshot.data!;
        for (var i = 0; i < countries.length; i++) {
          initVideoController(countries[i]['linkvideo'], i);
        }
        controllerVideos[0].play();

        return PageView.builder(
          itemCount: countries.length,
          scrollDirection: Axis.vertical,
          // preloadPagesCount: 1,
          onPageChanged: (position) {
            if (position == 0) {
              controllerVideos[position].play();
              return;
            }
            controllerVideos[position].play();
            controllerVideos[position - 1].pause();
          },
          // controller: PreloadPageController(initialPage: 0),
          itemBuilder: (context, index) {
            return Video(
              linkVideo: controllerVideos[index],
              username: countries[index]['username'],
              description: countries[index]['description'],
            );
          },
        );
      },
    );
  }
}
