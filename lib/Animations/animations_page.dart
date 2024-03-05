import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/GlobalState.dart';

class SlideTransitionScreen extends StatefulWidget {
  final Widget child;

  const SlideTransitionScreen({super.key, required this.child});

  @override
  State<SlideTransitionScreen> createState() => _SlideTransitionScreenState();
}

class _SlideTransitionScreenState extends State<SlideTransitionScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..forward();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isAnimationToLeftToRight =
        Provider.of<GlobalState>(context, listen: false)
            .isAnimationToLeftToRight;
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(isAnimationToLeftToRight ? 1.0 : -1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      )),
      child: widget.child,
    );
  }
}
