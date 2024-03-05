import 'package:flutter/material.dart';

class TextContentVideo extends StatefulWidget {
  final String title;
  final String textDescription;
  final String nameMusic;

  const TextContentVideo(
      {super.key,
      required this.textDescription,
      required this.nameMusic,
      required this.title});

  @override
  _TextContentVideoState createState() => _TextContentVideoState();
}

class _TextContentVideoState extends State<TextContentVideo> {
  bool _isDisabled = false;
  bool _isExpanded = true;
  final int _maxLines = 3;
  int actualLines = 0;

  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final renderObject = key.currentContext!.findRenderObject()!;
        final textSpan = TextSpan(
            text: widget.textDescription, style: const TextStyle(fontSize: 14));
        final textPainter = TextPainter(
          text: textSpan,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: renderObject.paintBounds.width);
        actualLines = textPainter.computeLineMetrics().length;

        setState(() {
          if (actualLines > _maxLines) _isDisabled = true;
        });
        // print('Số dòng thực tế của Text là: $actualLines');
        // print('$_maxLines');
      });

      return SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              key: key,
              widget.textDescription,
              maxLines: _isExpanded ? _maxLines : 10,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            _isDisabled
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                        print('xem them:$_isExpanded');
                      });
                    },
                    child: Text(
                      _isExpanded ? 'Xem thêm' : 'Ẩn bớt',
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )
                : const SizedBox(),

            //
            const SizedBox(height: 5),
            Text(
              widget.nameMusic,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    });
  }
}
