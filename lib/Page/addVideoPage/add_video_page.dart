import 'package:flutter/material.dart';

import '../../Animations/animations_page.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({super.key});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  @override
  Widget build(BuildContext context) {
    return SlideTransitionScreen(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          color: Colors.white,
          child: const Center(
              child: Text(
            'Tính năng đang phát triển',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          )),
        ),
        const SizedBox(
          height: 62,
        )
      ]),
    );
  }
}
