// Reusable text
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

const headerFontSize = 18.0;
const Color headerColour = Color(0xFF8D8E98);

class Heading extends StatelessWidget {
  String text;

  Heading({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: headerFontSize,
        color: headerColour,
      ),
    );
  }
}
