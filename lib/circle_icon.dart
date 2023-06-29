// Circle icon
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  IconData icon;

  CircleIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: const Color(0xFF1C2033),
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
