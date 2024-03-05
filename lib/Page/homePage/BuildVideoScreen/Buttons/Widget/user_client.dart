import 'package:flutter/material.dart';

import '../../../../../Animations/follow_icon_animation.dart';

class UserClient extends StatelessWidget {
  const UserClient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          Container(
            height: 60,
            width: 64,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.white, style: BorderStyle.solid, width: 1),
                image: const DecorationImage(
                    image: AssetImage('assets/img/girl.jpg'),
                    fit: BoxFit.cover)),
          ),
          const Positioned(
            bottom: 0,
            right: 22,
            child: Center(
              child: FollowAnimation(),
            ),
          ),
        ],
      ),
    );
  }
}
