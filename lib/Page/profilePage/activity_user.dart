import 'package:flutter/material.dart';

class activityUser extends StatefulWidget {
  const activityUser({super.key});

  @override
  State<activityUser> createState() => _activityUserState();
}

class _activityUserState extends State<activityUser> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '16',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Đang Follow',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        SizedBox(
          child: Column(
            children: [
              Text(
                '3',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Follower',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        SizedBox(
          child: Column(
            children: [
              Text(
                '0',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Thích',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
