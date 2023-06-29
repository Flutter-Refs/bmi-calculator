// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NumericText extends StatelessWidget {
  int value;

  NumericText({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value.toString(),
      style: const TextStyle(
        fontSize: 60.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
