import 'package:flutter/material.dart';

class infomationUser extends StatefulWidget {
  String name;
  infomationUser({super.key, required this.name});

  @override
  State<infomationUser> createState() => _infomationUserState();
}

class _infomationUserState extends State<infomationUser> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: null,
          child: Text(
            '@${widget.name}',
            style: const TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: null,
          child: const Icon(
            Icons.qr_code_scanner,
            size: 20,
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}
