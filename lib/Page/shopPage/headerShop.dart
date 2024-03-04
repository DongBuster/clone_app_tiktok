import 'package:flutter/material.dart';

class headerShop extends StatefulWidget {
  String searchSuggestions;
  headerShop({super.key, required this.searchSuggestions});

  @override
  State<headerShop> createState() => _headerShopState();
}

class _headerShopState extends State<headerShop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 300,
            height: 40,
            decoration: BoxDecoration(
                color: const Color(0xfff1f1f1),
                borderRadius: BorderRadius.circular(3)),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  iconColor: Colors.transparent,
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    size: 25,
                    color: Colors.black,
                  ),
                  suffixIcon: Container(
                      width: 90,
                      alignment: Alignment.center,
                      child: const Text('Tìm kiếm',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 17,
                              fontWeight: FontWeight.w500))),
                  contentPadding: EdgeInsets.zero,
                  hintText: widget.searchSuggestions,
                  hintStyle:
                      const TextStyle(color: Color(0xff9c9c9c), fontSize: 17),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(3),
                  )),
            ),
          ),
          const Row(
            children: [
              SizedBox(width: 5),
              SizedBox(
                  width: 35,
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Color(0xff161823),
                      ))),
              SizedBox(
                  width: 35,
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.menu,
                        color: Color(0xff161823),
                      ))),
            ],
          )
        ],
      ),
    );
  }
}
