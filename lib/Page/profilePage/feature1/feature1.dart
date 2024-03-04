import 'package:flutter/material.dart';

class feature1 extends StatefulWidget {
  const feature1({super.key});

  @override
  State<feature1> createState() => _feature1State();
}

class _feature1State extends State<feature1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFf1f1f1)),
            child: const Center(
              child: Text(
                'Sửa hồ sơ',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFf1f1f1)),
            child: const Center(
              child: Text(
                'Thêm bạn',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
