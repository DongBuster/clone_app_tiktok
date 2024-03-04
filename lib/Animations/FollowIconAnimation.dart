import 'dart:async';

import 'package:flutter/material.dart';

class FollowAnimation extends StatefulWidget {
  const FollowAnimation({super.key});

  @override
  _FollowAnimationState createState() => _FollowAnimationState();
}

class _FollowAnimationState extends State<FollowAnimation> {
  bool _isFollowing = true;
  bool _isVisible = false;

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
      Timer(const Duration(milliseconds: 1000), () {
        setState(() {
          _isVisible = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 1500),
      opacity: _isVisible ? 0 : 1,
      child: SizedBox(
        width: 20,
        height: 20,
        child: GestureDetector(
          onTap: _toggleFollow,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isFollowing ? Colors.red : Colors.white),
            child: Center(
                child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) {
                      return RotationTransition(
                        turns: child.key == const ValueKey('icon1')
                            ? Tween<double>(begin: 1, end: 0.75)
                                .animate(animation)
                            : Tween<double>(begin: 0.75, end: 1)
                                .animate(animation),
                        child: ScaleTransition(
                          scale: animation,
                          child: child,
                        ),
                      );
                    },
                    child: _isFollowing
                        ? const Icon(
                            key: ValueKey('icon1'),
                            Icons.add,
                            size: 18,
                            color: Colors.white,
                          )
                        : const Icon(
                            key: ValueKey('icon2'),
                            Icons.check_sharp,
                            size: 16,
                            color: Colors.blue,
                          ))),
          ),
        ),
      ),
    );
  }
}
