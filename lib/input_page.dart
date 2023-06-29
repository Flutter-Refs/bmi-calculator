// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const headerFontSize = 18.0;
const Color headerColour = Color(0xFF8D8E98);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double _heightSliderValue = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          // Gender
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: GenderChildCard(
                      gender: Gender.male,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: GenderChildCard(
                      gender: Gender.female,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Height
          Expanded(
            child: ReusableCard(
              colour: Color(0xFF101427),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Heading(
                    text: 'HEIGHT',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      NumericText(value: _heightSliderValue.round()),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Heading(
                          text: 'cm',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Slider(
                    value: _heightSliderValue,
                    max: 210,
                    min: 100,
                    label: _heightSliderValue.round().toString(),
                    thumbColor: Color(0xFFEA1556),
                    activeColor: Colors.white,
                    inactiveColor: headerColour,
                    onChanged: (double value) {
                      setState(() {
                        _heightSliderValue = value;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF101427),
                    cardChild: InputNumberCard(
                      type: InputNumberType.weight,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF101427),
                    cardChild: InputNumberCard(
                      type: InputNumberType.age,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFEA1556),
            width: double.infinity,
            height: bottomContainerHeight,
            margin: EdgeInsets.only(top: 10.0),
            child: TextButton(
              onPressed: () => {
                setState(
                  () => {},
                )
              },
              child: Center(
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Numeric text
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
      style: TextStyle(
        fontSize: 60.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Input number
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
        SizedBox(
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

// Circle icon
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
      backgroundColor: Color(0xFF1C2033),
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

// Reusable text
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
      style: TextStyle(
        fontSize: headerFontSize,
        color: headerColour,
      ),
    );
  }
}

// Gender card child
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
        SizedBox(
          height: headerFontSize,
        ),
        Heading(
          text: gender.name.toUpperCase(),
        ),
      ],
    );
  }
}

// Reusable card
class ReusableCard extends StatelessWidget {
  static const Color defaultColour = Color(0xFF1D1E33);
  Color colour;
  Widget? cardChild;

  ReusableCard({
    super.key,
    this.colour = defaultColour,
    this.cardChild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
      child: cardChild,
    );
  }
}

enum Gender {
  male,
  female
}

enum InputNumberType {
  weight,
  age,
}
