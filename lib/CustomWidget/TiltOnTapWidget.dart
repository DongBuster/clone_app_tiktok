import 'package:flutter/material.dart';

class TiltOnTapWidget extends StatefulWidget {
  final Widget child;
  bool isTilted;
  TiltOnTapWidget({super.key, required this.child, required this.isTilted});

  @override
  _TiltOnTapWidgetState createState() => _TiltOnTapWidgetState();
}

class _TiltOnTapWidgetState extends State<TiltOnTapWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Transform.rotate(
        angle: widget.isTilted ? -0.5 : 0.5,
        child: widget.child,
      ),
    );
  }
}
