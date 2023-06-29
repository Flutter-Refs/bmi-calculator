// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/gender.dart';
import 'package:bmi_calculator/gender_child_card.dart';
import 'package:bmi_calculator/label_text.dart';
import 'package:bmi_calculator/numeric_text.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
Gender? selectedGender;

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
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                    cardChild: GenderChildCard(
                      gender: Gender.male,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
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
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LabelText(
                    text: 'HEIGHT',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _heightSliderValue.round().toString(),
                        style: kNumberTextStyle,
                      ),
                      LabelText(
                        text: 'cm',
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
                    thumbColor: kSecondaryColour,
                    activeColor: Colors.white,
                    inactiveColor: kHeaderColour,
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
                    onPress: () {},
                    // cardChild: InputNumberCard(
                    //   type: InputNumberType.weight,
                    // ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    // cardChild: InputNumberCard(
                    //   type: InputNumberType.age,
                    // ),
                  ),
                ),
              ],
            ),
          ),
          // Calculate BMI
          Container(
            color: kSecondaryColour,
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
