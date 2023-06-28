// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF090c22),
          secondary: Color(0xFFea1556),
        ),
        scaffoldBackgroundColor: Color(0xFF090c22),
      ),
      home: InputPage(),
    );
  }
}
