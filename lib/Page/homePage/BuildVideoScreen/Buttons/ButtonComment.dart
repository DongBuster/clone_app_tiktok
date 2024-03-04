import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonComment extends StatefulWidget {
  const ButtonComment({super.key});

  @override
  State<ButtonComment> createState() => _ButtonCommentState();
}

class _ButtonCommentState extends State<ButtonComment> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        child: SvgPicture.asset(
          height: 30,
          width: 30,
          color: Colors.white,
          'assets/svg/comment1.svg',
        ),
      ),
      const SizedBox(height: 5),
      const Text(
        '1,2K',
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
      )
    ]);
  }
}
