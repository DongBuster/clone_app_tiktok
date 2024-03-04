import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class flashSale extends StatefulWidget {
  const flashSale({super.key});

  @override
  State<flashSale> createState() => _flashSaleState();
}

class _flashSaleState extends State<flashSale> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
      height: 200,
      width: mq.width - 20,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 10,
                    child: Text('F',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                  ),
                  SizedBox(
                    width: 20,
                    height: 25,
                    child: Icon(
                      Icons.flash_on,
                      // size: 25,
                      color: Colors.redAccent,
                    ),
                  ),
                  Text('ash sale',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    // width: 90,
                    height: 20,
                    decoration: BoxDecoration(
                        // color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: TimerCountdown(
                      colonsTextStyle: const TextStyle(color: Colors.red),
                      format: CountDownTimerFormat.hoursMinutesSeconds,
                      enableDescriptions: false,
                      timeTextStyle:
                          const TextStyle(color: Colors.black, fontSize: 12),
                      endTime: DateTime.now().add(
                        const Duration(hours: 14, minutes: 30, seconds: 50),
                      ),
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 2, right: 2),
                  //   child: Column(
                  //     children: [
                  //       Icon(Icons.circle, size: 5),
                  //       Icon(Icons.circle, size: 5),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   width: 20,
                  //   height: 20,
                  //   decoration: BoxDecoration(
                  //       color: Colors.black,
                  //       borderRadius: BorderRadius.circular(5)),
                  //   child: TimerCountdown(
                  //     format: CountDownTimerFormat.minutesOnly,
                  //     enableDescriptions: false,
                  //     timeTextStyle:
                  //         TextStyle(color: Colors.white, fontSize: 12),
                  //     endTime: DateTime.now().add(
                  //       Duration(hours: 14, minutes: 30, seconds: 50),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   width: 20,
                  //   height: 20,
                  //   decoration: BoxDecoration(
                  //       color: Colors.black,
                  //       borderRadius: BorderRadius.circular(5)),
                  //   child: TimerCountdown(
                  //     format: CountDownTimerFormat.secondsOnly,
                  //     enableDescriptions: false,
                  //     timeTextStyle:
                  //         TextStyle(color: Colors.white, fontSize: 12),
                  //     endTime: DateTime.now().add(
                  //       Duration(hours: 14, minutes: 30, seconds: 50),
                  //     ),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              flashSaleBanner('assets/img/airpod.png', 40, '25.000', '50.000'),
              flashSaleBanner('assets/img/airpod.png', 30, '25.000', '30.000'),
              flashSaleBanner('assets/img/airpod.png', 10, '25.000', '60.000'),
            ],
          )),
        ],
      ),
    );
  }
}

Widget flashSaleBanner(
    String url, int percent, String price, String salePrice) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          alignment: Alignment.bottomLeft,
          width: 85,
          height: 88,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(url), fit: BoxFit.fill)),
          child: Stack(
            children: [
              Container(
                  height: 18,
                  decoration: const BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ))),
              Container(
                  width: percent.toDouble(),
                  height: 18,
                  decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                      ))),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('  $percent',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const Icon(
                    Icons.percent,
                    size: 14,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          )),
      const SizedBox(height: 8),
      Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('$priceđ',
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold))),
      Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('$salePriceđ',
              style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff9c9c9c),
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Color(0xff9c9c9c),
                  decorationThickness: 2))),
    ],
  );
}
