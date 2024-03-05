import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MailImageUser extends StatefulWidget {
  final String name;
  final String url;
  const MailImageUser({super.key, required this.url, required this.name});

  @override
  State<MailImageUser> createState() => _MailImageUserState();
}

class _MailImageUserState extends State<MailImageUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: widget.url,
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            errorWidget: (context, url, error) {
              return const Icon(
                Icons.person,
                size: 25,
              );
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            constraints: const BoxConstraints(maxWidth: 90),
            child: Text(
              widget.name,
              style: const TextStyle(
                  fontSize: 14, overflow: TextOverflow.ellipsis),
            ),
          )
        ],
      ),
    );
  }
}
