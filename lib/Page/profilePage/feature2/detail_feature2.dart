import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class detailFeature2 extends StatefulWidget {
  final TabController tabController;
  const detailFeature2({super.key, required this.tabController});

  @override
  State<detailFeature2> createState() => _detailFeature2State();
}

class _detailFeature2State extends State<detailFeature2> {
  late String _selectedText = 'Bài đăng';

  @override
  Widget build(BuildContext context) {
    return TabBarView(controller: widget.tabController, children: [
      // library video
      Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.photo_library_outlined,
              size: 50,
              color: Color(0xFF9c9c9c),
            ),
            const SizedBox(height: 5),
            //
            const Text(
              'Đâu là những bức ảnh đẹp bạn đã',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const Text(
              'chụp được gần đây?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            //
            const SizedBox(height: 5),
            GestureDetector(
              onTap: null,
              child: Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.red),
                child: const Center(
                  child: Text(
                    'Tải lên',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // private variables
      Container(
        color: Colors.white,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Video riêng tư của bạn',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'Để các video của bạn chỉ hiện thị với riêng ban, hãy đặt',
              style: TextStyle(fontSize: 14, color: Colors.black38),
            ),
            SizedBox(height: 2),
            Text(
              'đặt video thành "Riêng tư" trong phần cài đặt.',
              style: TextStyle(fontSize: 14, color: Colors.black38),
            ),
            //
          ],
        ),
      ),
      //bookmark video
      Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedText = 'Bài đăng';
                            });
                          },
                          child: selectText(
                              text: 'Bài đăng', selectedText: _selectedText)),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedText = 'Bình luận';
                          });
                        },
                        child: selectText(
                            text: 'Bình luận', selectedText: _selectedText)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedText = 'Hiệu ứng';
                          });
                        },
                        child: selectText(
                            text: 'Hiệu ứng', selectedText: _selectedText)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedText = 'Âm thanh';
                          });
                        },
                        child: selectText(
                            text: 'Âm thanh', selectedText: _selectedText)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedText = 'Bộ sưu tập';
                          });
                        },
                        child: selectText(
                            text: 'Bộ sưu tập', selectedText: _selectedText)),
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedText = 'Câu hỏi';
                              });
                            },
                            child: selectText(
                                text: 'Câu hỏi', selectedText: _selectedText))),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          )),
      Container(
        color: Colors.white,
      ),
    ]);
  }
}

class selectText extends StatefulWidget {
  String text;
  String selectedText;
  selectText({super.key, required this.text, required this.selectedText});

  @override
  State<selectText> createState() => _selectTextState();
}

class _selectTextState extends State<selectText> {
  Color handleColorText(String text) {
    if (widget.selectedText == text) {
      return Colors.black;
    } else {
      print('Text:${widget.text}');
      print('selectedText:${widget.selectedText}');
      return const Color(0xFF9c9c9c);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Center(
        child: Text(widget.text,
            style:
                TextStyle(fontSize: 15, color: handleColorText(widget.text))),
      ),
    );
  }
}
