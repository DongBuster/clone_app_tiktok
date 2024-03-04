import 'package:clone_app_tiktok/Animations/AnimationsPage.dart';
import 'package:flutter/material.dart';
import 'package:clone_app_tiktok/BuildApp/FooterApp.dart';

class MainLayout extends StatefulWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            widget.child,
            const FooterApp(),
          ],
        ),
      ),
    );
  }
}
