import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../provider/GlobalState.dart';
import '../../service/login_with_google.dart';

class HeaderProfile extends StatefulWidget {
  final String nickname;
  const HeaderProfile({super.key, required this.nickname});

  @override
  State<HeaderProfile> createState() => _HeaderProfileState();
}

class _HeaderProfileState extends State<HeaderProfile> {
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
                            await LoginWithGoogle.logoutWithGoogle();

                            if (context.mounted) {
                              setState(() {
                                Provider.of<GlobalState>(context, listen: false)
                                    .setIsLogin(false);
                              });

                              context.go('/login');
                            }
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
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ),
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

class DetailMenu extends StatefulWidget {
  const DetailMenu({super.key});

  @override
  State<DetailMenu> createState() => _DetailMenuState();
}

class _DetailMenuState extends State<DetailMenu> {
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
