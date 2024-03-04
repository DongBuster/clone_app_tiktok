import 'package:flutter/material.dart';

class addBio extends StatefulWidget {
  const addBio({super.key});

  @override
  State<addBio> createState() => _addBioState();
}

class _addBioState extends State<addBio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFf1f1f1)),
        child: const Center(
          child: Text(
            '+ Thêm tiểu sử',
            style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
