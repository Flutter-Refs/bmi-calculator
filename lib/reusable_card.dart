// Reusable card
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  static const Color defaultColour = Color(0xFF1D1E33);
  final Color colour;
  final Widget? cardChild;
  final VoidCallback onPress;

  const ReusableCard({
    super.key,
    this.colour = defaultColour,
    this.cardChild,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
