import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../main.dart';

class ThreeBallIndicator extends StatefulWidget {
  const ThreeBallIndicator({super.key});

  @override
  State<ThreeBallIndicator> createState() => _ThreeBallIndicatorState();
}

class _ThreeBallIndicatorState extends State<ThreeBallIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: mq.width,
        height: mq.height,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.circle, size: 10, color: Colors.red)
                .animate(
                    // delay: 1.seconds,
                    onPlay: (controller) => controller.repeat())
                .moveY(begin: 2, end: -2),
            const Gap(2),
            const Icon(Icons.circle, size: 10, color: Colors.blue)
                .animate(
                    // delay: 2.seconds,
                    onPlay: (controller) => controller.repeat())
                .moveY(begin: -1, end: 1),
            const Gap(2),
            const Icon(Icons.circle, size: 10, color: Colors.white)
                .animate(
                    // delay: 3.seconds,
                    onPlay: (controller) => controller.repeat())
                .moveY(begin: -2, end: 2),
          ],
        ));
  }
}
