import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_app_tiktok/provider/GlobalState.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:clone_app_tiktok/Page/loginPage/loginWithGoogle.dart';

class headerProfile extends StatefulWidget {
  String nickname;
  headerProfile({super.key, required this.nickname});

  @override
  State<headerProfile> createState() => _headerProfileState();
}

class _headerProfileState extends State<headerProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://cdn-icons-png.flaticon.com/512/6620/6620722.png',
              width: 25,
              height: 25,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return Image.asset(
                  'assets/img/rose.png',
                  width: 25,
                  height: 25,
                );
              },
            ),
            GestureDetector(
              onTap: null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 60),
                  Text(
                    widget.nickname,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.arrow_drop_down,
                      size: 20, color: Colors.black)
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: null,
                  child: Image.asset('assets/img/footprints.png',
                      width: 25, height: 20),
                ),
                IconButton(
                  onPressed: () {
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(
                        MediaQuery.of(context).size.width,
                        40.0,
                        0.0,
                        0.0,
                      ),
                      items: [
                        PopupMenuItem(
                            onTap: () async {
                              await loginWithGoogle.logoutWithGoogle();
                              // if (mounted) {
                              setState(() {
                                Provider.of<GlobalState>(context, listen: false)
                                    .setIsLogin(false);
                              });
                              // Navigator.pop(context);

                              context.go('/login');
                              print(
                                  'islogin: ${Provider.of<GlobalState>(context, listen: false).isLogin}');
                              // } else {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text('Logout failed'),
                              //     ),
                              //   );
                              //   // }
                            },
                            height: 20,
                            value: 'logout',
                            child: TextButton.icon(
                                onPressed: null,
                                icon: const Icon(
                                  Icons.logout,
                                  color: Colors.red,
                                ),
                                label: const Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ))),
                      ],
                    );
                  },
                  icon: const Icon(
                    Icons.menu_sharp,
                    color: Colors.black,
                  ),
                  iconSize: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class detailMenu extends StatefulWidget {
  const detailMenu({super.key});

  @override
  State<detailMenu> createState() => _detailMenuState();
}

class _detailMenuState extends State<detailMenu> {
  @override
  Widget build(BuildContext context) {
    return drawerMenu();
  }
}

Widget drawerMenu() {
  return const Drawer(
    width: 100,
    child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.logout_rounded, size: 25),
          title: Text('Logout'),
        )
      ],
    ),
  );
}
