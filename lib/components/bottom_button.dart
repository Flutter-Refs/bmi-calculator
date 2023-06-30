// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/common/constants.dart';
import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;

class BottomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const BottomButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: kSecondaryColour,
        width: double.infinity,
        height: bottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            label,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
