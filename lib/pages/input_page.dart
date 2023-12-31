// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/common/constants.dart';
import 'package:bmi_calculator/common/enums/gender.dart';
import 'package:bmi_calculator/components/gender_child_card.dart';
import 'package:bmi_calculator/components/label_text.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Gender? selectedGender;
double height = 170;
int weight = 75;
int age = 20;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
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
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
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
                        height.round().toString(),
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
                  SliderTheme(
                    data: SliderThemeData(activeTrackColor: kPrimaryColour),
                    child: Slider(
                      value: height,
                      max: 210,
                      min: 100,
                      label: height.round().toString(),
                      thumbColor: kSecondaryColour,
                      activeColor: Colors.white,
                      inactiveColor: kHeaderColour,
                      onChanged: (double value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LabelText(
                          text: 'WEIGHT',
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // minus btn
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            // plus btn
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LabelText(
                          text: 'AGE',
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // minus btn
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            // plus btn
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Calculate BMI
          BottomButton(
              label: 'CALCULATE YOUR BMI',
              onPressed: () {
                Calculator bmiCalculator =
                    Calculator(height: height.round(), weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: bmiCalculator.calculateBMI(),
                      resultText: bmiCalculator.getResult(),
                      interpretation: bmiCalculator.getInterpretation(),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
