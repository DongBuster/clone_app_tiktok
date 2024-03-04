import 'package:clone_app_tiktok/Animations/AnimationsPage.dart';
import 'package:clone_app_tiktok/Page/shopPage/flashSale.dart';
import 'package:clone_app_tiktok/Page/shopPage/headerShop.dart';
import 'package:clone_app_tiktok/Page/shopPage/offerCustomer.dart';
import 'package:clone_app_tiktok/Page/shopPage/products/products.dart';

import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  bool isScrolling = false;

  List<String> posts = [
    'assets/img/girl.jpg',
    'assets/img/sontung.jpg',
    'assets/img/rose.png',
    'assets/img/footprints.png',
  ];
  int _selectedTab = 0;
  List<String> tabs = [
    'Tất cả',
    'Quần áo nữ',
    'Quần áo nam',
    'Áo khoác',
    'Tai nghe'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransitionScreen(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Color(0xfff1f1f1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              headerShop(
                searchSuggestions: 'tai nghe m10',
              ),
              Expanded(
                  child: Stack(
                children: [
                  NotificationListener<ScrollNotification>(
                      onNotification: (scrollNotification) {
                        setState(() {
                          isScrolling = scrollNotification.metrics.pixels > 0;
                        });
                        return false;
                      },
                      child: DefaultTabController(
                        length: 5,
                        child: NestedScrollView(
                          headerSliverBuilder: (context, innerBoxIsScrolled) {
                            return [
                              const SliverAppBar(
                                backgroundColor: Colors.transparent,
                                collapsedHeight: 440,
                                expandedHeight: 440,
                                flexibleSpace: Column(
                                  children: [
                                    offerCustomer(),
                                    SizedBox(height: 10),
                                    flashSale(),
                                  ],
                                ),
                              ),
                              SliverPersistentHeader(
                                delegate: MyDelegate(TabBar(
                                  isScrollable: true,
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  tabs: tabs
                                      .map((e) => Container(
                                            alignment: Alignment.center,
                                            height: 35,
                                            child: Text(e,
                                                style: TextStyle(
                                                    color: _selectedTab ==
                                                            tabs.indexOf(e)
                                                        ? Colors.black
                                                        : const Color(
                                                            0xff9c9c9c),
                                                    fontSize: 18)),
                                          ))
                                      .toList(),
                                  indicatorColor: Colors.black,
                                  onTap: (value) {
                                    _selectedTab = value;
                                  },
                                )),
                                floating: true,
                                pinned: true,
                              )
                            ];
                          },
                          body: TabBarView(
                            children: [1, 2, 3, 4, 5]
                                .map((tab) => const roductsCaterogy())
                                .toList(),
                          ),
                        ),
                      )),
                  Positioned(
                    top: 100,
                    right: 0,
                    child: Opacity(
                        opacity: isScrolling ? 0.5 : 1,
                        child: const SizedBox(
                          width: 50,
                          height: 50,
                          // color: Colors.green,
                        )),
                  ),
                ],
              )),
              const SizedBox(height: 62)
            ]),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.black12))),
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
