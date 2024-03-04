import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonShare extends StatelessWidget {
  const ButtonShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        child: SvgPicture.asset(height: 35, width: 35, 'assets/svg/share.svg'),
      ),
      // const SizedBox(height: 5),
      const Text(
        '123',
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
      )
    ]);
  }
}
