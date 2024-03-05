import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class InboxMessage extends StatefulWidget {
  final Color backgroundColor;
  final IconData icon;
  final int quantity;
  final String title;
  final String subtitle;
  const InboxMessage({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.quantity,
  });

  @override
  State<InboxMessage> createState() => _InboxMessageState();
}

class _InboxMessageState extends State<InboxMessage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.backgroundColor,
          ),
          child: Icon(
            widget.icon,
            size: 30,
            color: Colors.white,
          ),
        ),
        title: Text(widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        subtitle: Text(widget.subtitle, style: const TextStyle(fontSize: 14)),
        trailing: widget.quantity != 0
            ? Container(
                alignment: Alignment.center,
                width: 20,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Text("${widget.quantity}",
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
              )
            : badges.Badge(
                position: badges.BadgePosition.center(),
              ),
      ),
    );
  }
}
