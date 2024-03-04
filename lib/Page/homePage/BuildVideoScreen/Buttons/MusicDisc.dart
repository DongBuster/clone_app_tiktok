import 'package:flutter/material.dart';

class MusicDisc extends StatefulWidget {
  bool isplaying;
  MusicDisc({super.key, required this.isplaying});

  @override
  State<MusicDisc> createState() => _MusicDiscState();
}

class _MusicDiscState extends State<MusicDisc> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));

    _animationController.repeat();
    _animationController.addListener(() {
      setState(() {
        if (widget.isplaying) {
          _animationController.forward();
        } else {
          _animationController.stop();
        }
        // initState();
      });
    });
    // _toggleAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateAnimationController() {
    if (widget.isplaying) {
      if (_animationController.isCompleted) {
        _animationController.repeat();
      } else {
        _animationController.forward();
      }
    } else {
      _animationController.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    _updateAnimationController();
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/img/sontung.jpg'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
