import 'package:flutter/material.dart';

class offerCustomer extends StatefulWidget {
  const offerCustomer({super.key});

  @override
  State<offerCustomer> createState() => _offerCustomerState();
}

class _offerCustomerState extends State<offerCustomer> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 220,
      width: mq.width - 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          //tag sale
          Positioned(
            top: 15,
            right: 10,
            child: Container(
              width: 80,
              height: 40,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/saleTag.jpg'),
                      opacity: 0.6)),
            ),
          ),
          Positioned(
            top: 10,
            right: 8,
            left: 8,
            bottom: 8,
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Ưu Đãi Khách Hàng Mới',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 22,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(3)),
                      child: const Text(
                        'Lương Về',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      saleBanner('assets/img/ip.jpg'),
                      saleBanner('assets/img/ip.jpg'),
                      saleBanner('assets/img/ip.jpg'),
                      saleBanner('assets/img/ip.jpg'),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget saleBanner(String url) {
  return SizedBox(
    // width: 70,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 2, right: 8),
          alignment: Alignment.bottomLeft,
          width: 82,
          height: 94,
          decoration: BoxDecoration(
              // border: Border.all(color: Color(0xff9c9c9c)),
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(image: AssetImage(url), fit: BoxFit.fill)),
          child: Container(
            width: 50,
            height: 20,
            decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.keyboard_double_arrow_down_outlined,
                  size: 15,
                  color: Colors.white,
                ),
                Text('50',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.percent,
                  size: 14,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('25.000đ',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold))),
        const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text('50.000đ',
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff9c9c9c),
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Color(0xff9c9c9c),
                    decorationThickness: 2))),
      ],
    ),
  );
}
