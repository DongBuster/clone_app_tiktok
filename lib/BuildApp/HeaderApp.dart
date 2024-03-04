import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class HeaderApp extends StatefulWidget {
  const HeaderApp({super.key});

  @override
  State<HeaderApp> createState() => _HeaderAppState();
}

class _HeaderAppState extends State<HeaderApp> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        right: (mq.width - 210) / 2,
        top: 10,
        child: Wrap(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selected = true;
                });
              },
              child: Text(
                'Đang follow',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: _selected ? Colors.white : Colors.white60),
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selected = false;
                });
              },
              child: Text(
                'Dành cho bạn',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: _selected ? Colors.white60 : Colors.white),
              ),
            )
          ],
        ),
      ),
      // animation bottom bar
      AnimatedPositioned(
        right: _selected ? 135 + 120 : 135,
        top: 32,
        duration: const Duration(milliseconds: 145),
        child: Container(
          height: 3,
          width: 26,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white),
        ),
      ),
      // icon search
      Positioned(
        top: 10,
        right: 0,
        child: SizedBox(
            width: 50,
            child: SvgPicture.asset(
              'assets/svg/search.svg',
              width: 35,
              height: 35,
            )),
      )
    ]);
  }
}
