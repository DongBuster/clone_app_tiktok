import 'package:flutter/material.dart';

class roductsCaterogy extends StatefulWidget {
  const roductsCaterogy({super.key});

  @override
  State<roductsCaterogy> createState() => _roductsCaterogyState();
}

class _roductsCaterogyState extends State<roductsCaterogy> {
  List<String> posts = [
    'assets/img/girl.jpg',
    'assets/img/sontung.jpg',
    'assets/img/rose.png',
    'assets/img/footprints.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 8,
          mainAxisExtent: 330),
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  image: DecorationImage(
                      image: AssetImage('assets/img/m10pro.jpg'),
                      fit: BoxFit.fill)),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Tai nghe Bluetooth M10 Phiên bản Pro nâng cấp',
                        style: TextStyle(color: Colors.black87, fontSize: 16)),
                    Row(
                      children: [
                        const Text('98.000đ',
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 20)),
                        const SizedBox(width: 5),
                        Container(
                          alignment: Alignment.center,
                          width: 28,
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.red[100],
                              borderRadius: BorderRadius.circular(3)),
                          child: Text('-40%',
                              style: TextStyle(
                                  color: Colors.red[400], fontSize: 12)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Container(
                      alignment: Alignment.center,
                      width: 35,
                      height: 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                              color: const Color.fromARGB(255, 243, 140, 140))),
                      child: Text('COD',
                          style:
                              TextStyle(color: Colors.red[400], fontSize: 12)),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 15),
                        const Text('4.6',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87)),
                        Container(
                            margin: const EdgeInsets.only(left: 3, right: 3),
                            width: 1,
                            height: 8,
                            color: const Color(0xff9c9c9c)),
                        const Text('Đã bán 39.9k',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87)),
                      ],
                    )
                  ],
                )),
          ]),
        );
      },
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
      color: const Color(0xfff1f1f1),
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
