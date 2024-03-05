import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: videos,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ThreeBallIndicator();
        }
        final countries = snapshot.data!;

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
