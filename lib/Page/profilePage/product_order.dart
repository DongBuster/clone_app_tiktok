import 'package:flutter/material.dart';

class productOrder extends StatelessWidget {
  const productOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 20,
            color: Colors.redAccent,
          ),
          SizedBox(width: 2),
          Text(
            'Đơn hàng',
            style: TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
