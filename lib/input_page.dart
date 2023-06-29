// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/gender_card_child.dart';
import 'package:bmi_calculator/heading.dart';
import 'package:bmi_calculator/input_number_card.dart';
import 'package:bmi_calculator/input_number_type.dart';
import 'package:bmi_calculator/numeric_text.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
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
