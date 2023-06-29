// ignore_for_file: must_be_immutable

import 'package:bmi_calculator/circle_icon.dart';
import 'package:bmi_calculator/heading.dart';
import 'package:bmi_calculator/input_number_type.dart';
import 'package:bmi_calculator/numeric_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputNumberCard extends StatefulWidget {
  String _title = '';
  int _defaultInputNumber = 0;

  InputNumberCard({super.key, required InputNumberType type}) {
    _setInputNumberFields(type);
  }

  @override
  // ignore: no_logic_in_create_state
  State<InputNumberCard> createState() => _InputNumberCardState(
        _title,
        _defaultInputNumber,
      );

  // Helpers
  void _setInputNumberFields(InputNumberType type) {
    switch (type) {
      case InputNumberType.weight:
        _title = type.name.toUpperCase();
        _defaultInputNumber = 75;
        break;
      case InputNumberType.age:
        _title = type.name.toUpperCase();
        _defaultInputNumber = 20;
        break;
    }
  }
}

class _InputNumberCardState extends State<InputNumberCard> {
  String title = '';
  int defaultInputNumber = 0;

  _InputNumberCardState(this.title, this.defaultInputNumber);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Heading(
          text: title,
        ),
        NumericText(
          value: defaultInputNumber,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // minus btn
            TextButton(
              onPressed: () => {
                setState(() => defaultInputNumber--)
              },
              child: CircleIcon(
                icon: FontAwesomeIcons.minus,
              ),
            ),
            // plus btn
            TextButton(
              onPressed: () => {
                setState(() => defaultInputNumber++)
              },
              child: CircleIcon(
                icon: FontAwesomeIcons.plus,
              ),
            ),
          ],
        )
      ],
    );
  }
}
