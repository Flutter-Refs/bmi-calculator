// Reusable text
// ignore_for_file: must_be_immutable

import 'package:bmi_calculator/common/constants.dart';
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  String text;

  LabelText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kLabelTextStyle,
    );
  }
}
