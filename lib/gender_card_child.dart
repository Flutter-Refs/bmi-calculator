// ignore_for_file: must_be_immutable

import 'package:bmi_calculator/heading.dart';
import 'package:bmi_calculator/gender.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderChildCard extends StatelessWidget {
  Gender gender;

  GenderChildCard({
    super.key,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          (gender == Gender.male) ? FontAwesomeIcons.mars : FontAwesomeIcons.venus,
          size: 70.0,
          color: headerColour,
        ),
        const SizedBox(
          height: 18,
        ),
        Heading(
          text: gender.name.toUpperCase(),
        ),
      ],
    );
  }
}
