import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class imageUser extends StatefulWidget {
  String url;
  imageUser({super.key, required this.url});

  @override
  State<imageUser> createState() => _imageUserState();
}

class _imageUserState extends State<imageUser> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              border: Border.all(
                  color: Colors.white, style: BorderStyle.solid, width: 1)),
        );
      },
      errorWidget: (context, url, error) => Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.black12, style: BorderStyle.solid, width: 1),
        ),
        child: const Icon(
          Icons.person,
          size: 50,
          color: Colors.blue,
        ),
      ),
    );
  }
}
