import 'package:flutter/material.dart';

class InkWellWidget extends StatefulWidget {
  final Widget Function(bool isTapped) builder;
  final Color color;
  final BorderRadius borderRadius;
  final ShapeBorder customBorder;
  final VoidCallback onTap;

  const InkWellWidget({
    super.key,
    required this.builder,
    required this.onTap,
    required this.color,
    required this.borderRadius,
    required this.customBorder,
  });

  @override
  _InkWellWidgetState createState() => _InkWellWidgetState();
}

class _InkWellWidgetState extends State<InkWellWidget> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.color;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: color,
        highlightColor: color,
        hoverColor: Colors.transparent,
        borderRadius: widget.borderRadius,
        onTap: widget.onTap,
        // onHighlightChanged: (isTapped) =>
        //     setState(() => this.isTapped = isTapped),
        customBorder: widget.customBorder,
        child: widget.builder(isTapped),
      ),
    );
  }
}
