import 'package:clone_app_tiktok/Route/App_Route.dart';
import 'package:clone_app_tiktok/provider/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FooterApp extends StatefulWidget {
  const FooterApp({super.key});

  @override
  State<FooterApp> createState() => _FooterAppState();
}

class _FooterAppState extends State<FooterApp> {
  final int _selected = 0;

  @override
  Widget build(BuildContext context) {
    bool isLogin = Provider.of<GlobalState>(context, listen: true).isLogin;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Consumer<GlobalState>(builder: (context, globalState, child) {
        return Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          height: 60,
          decoration: BoxDecoration(
              color: AppRoute.router.location != '/home'
                  ? Colors.white
                  : Colors.transparent,
              border: Border(
                  top: _selected == 0
                      ? BorderSide.none
                      : const BorderSide(color: Colors.black12, width: 1))),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //home
                GestureDetector(
                    onTap: () {
                      context.go('/home');
                      Provider.of<GlobalState>(context, listen: false)
                          .setIndexPage(0);
                    },
                    child: SizedBox(
                      width: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/home.svg',
                              width: 35,
                              height: 35,
                              color: AppRoute.router.location == '/home'
                                  ? Colors.white
                                  : AppRoute.router.location == '/home'
                                      ? const Color(0xFFf0e9e5)
                                      : const Color(0xFF9c9c9c)),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: AppRoute.router.location == '/home'
                                  ? Colors.white
                                  : AppRoute.router.location == '/home'
                                      ? const Color(0xFFf0e9e5)
                                      : const Color(0xFF9c9c9c),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          )
                        ],
                      ),
                    )),
                // shop
                GestureDetector(
                    onTap: () {
                      context.go('/shop');
                      Provider.of<GlobalState>(context, listen: false)
                          .setIndexPage(1);
                    },
                    child: SizedBox(
                      width: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            AppRoute.router.location == '/shop'
                                ? Icons.shopping_bag
                                : Icons.shopping_bag_outlined,
                            color: AppRoute.router.location == '/shop'
                                ? Colors.black
                                : AppRoute.router.location == '/home'
                                    ? const Color(0xFFf0e9e5)
                                    : const Color(0xFF9c9c9c),
                            size: 30,
                          ),
                          Text(
                            'Shop',
                            style: TextStyle(
                              color: AppRoute.router.location == '/shop'
                                  ? Colors.black
                                  : AppRoute.router.location == '/home'
                                      ? const Color(0xFFf0e9e5)
                                      : const Color(0xFF9c9c9c),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          )
                        ],
                      ),
                    )),
                // add video
                GestureDetector(
                  onTap: () {
                    Provider.of<GlobalState>(context, listen: false)
                        .setIndexPage(2);
                    context.go('/addvideo');
                  },
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.red],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)),
                    child: Center(
                      child: Container(
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppRoute.router.location == '/home'
                              ? Colors.white
                              : Colors.black,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(
                          Icons.add,
                          color: AppRoute.router.location == '/home'
                              ? Colors.black
                              : Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),

                // mail
                GestureDetector(
                    onTap: () {
                      context.go('/mail');

                      Provider.of<GlobalState>(context, listen: false)
                          .setIndexPage(3);
                    },
                    child: SizedBox(
                      width: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/svg/mail.svg',
                              width: 35,
                              height: 35,
                              color: AppRoute.router.location == '/mail'
                                  ? Colors.black
                                  : AppRoute.router.location == '/home'
                                      ? const Color(0xFFf0e9e5)
                                      : const Color(0xFF9c9c9c)),
                          Text(
                            'Hộp thư',
                            style: TextStyle(
                                color: AppRoute.router.location == '/mail'
                                    ? Colors.black
                                    : AppRoute.router.location == '/home'
                                        ? const Color(0xFFf0e9e5)
                                        : const Color(0xFF9c9c9c),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                                wordSpacing: -1),
                          )
                        ],
                      ),
                    )),
                // profile
                GestureDetector(
                    onTap: () {
                      context.go('/profile');

                      Provider.of<GlobalState>(context, listen: false)
                          .setIndexPage(4);
                    },
                    child: SizedBox(
                      width: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/user.svg',
                              width: 35,
                              height: 35,
                              color: AppRoute.router.location == '/profile'
                                  ? Colors.black
                                  : AppRoute.router.location == '/home'
                                      ? const Color(0xFFf0e9e5)
                                      : const Color(0xFF9c9c9c)),
                          Text(
                            'Hồ sơ',
                            style: TextStyle(
                              color: AppRoute.router.location == '/profile'
                                  ? Colors.black
                                  : AppRoute.router.location == '/home'
                                      ? const Color(0xFFf0e9e5)
                                      : const Color(0xFF9c9c9c),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                              wordSpacing: -1,
                            ),
                          )
                        ],
                      ),
                    )),
              ]),
        );
      }),
    );
  }
}
