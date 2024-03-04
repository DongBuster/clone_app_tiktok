import 'package:clone_app_tiktok/CustomWidget/TiltOnTapWidget.dart';
import 'package:flutter/material.dart';

class HeartAnimation extends StatefulWidget {
  bool isTilted;
  bool isFavorite;
  double top, left;

  HeartAnimation(
      {super.key,
      required this.isTilted,
      required this.isFavorite,
      required this.top,
      required this.left});

  @override
  _HeartAnimationState createState() => _HeartAnimationState();
}

class _HeartAnimationState extends State<HeartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isFavorite
        ? Positioned(
            top: widget.top,
            left: widget.left,
            child: Stack(
              children: [
                TiltOnTapWidget(
                  isTilted: widget.isTilted,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 60.0,
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: Tween<double>(begin: 1.0, end: 4.0)
                          .animate(_controller)
                          .value,
                      child: Opacity(
                        opacity: Tween<double>(begin: 1.0, end: 0.0)
                            .animate(_controller)
                            .value,
                        child: TiltOnTapWidget(
                          isTilted: widget.isTilted,
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 60.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
