import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class feature2 extends StatefulWidget {
  final TabController tabController;

  const feature2({super.key, required this.tabController});

  @override
  State<feature2> createState() => _feature2State();
}

class _feature2State extends State<feature2> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
        decoration: const BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(color: Color.fromARGB(10, 0, 0, 0), width: 1))),
        child: TabBar(
          indicatorColor: Colors.black,
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          controller: widget.tabController,
          onTap: (value) {
            setState(() {
              _selectedTab = value;
            });
          },
          tabs: [
            Tab(
              icon: SvgPicture.asset(
                'assets/svg/tabmenu.svg',
                width: 25,
                height: 25,
                color:
                    _selectedTab == 0 ? Colors.black : const Color(0xFF9c9c9c),
              ),
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/svg/lock.svg',
                width: 20,
                height: 20,
                color:
                    _selectedTab == 1 ? Colors.black : const Color(0xFF9c9c9c),
              ),
            ),
            Tab(
              icon: Icon(Icons.bookmark_border,
                  size: 25,
                  color: _selectedTab == 2
                      ? Colors.black
                      : const Color(0xFF9c9c9c)),
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/svg/liked.svg',
                width: 25,
                height: 25,
                color:
                    _selectedTab == 3 ? Colors.black : const Color(0xFF9c9c9c),
              ),
            ),
          ],
        ));
  }
}
