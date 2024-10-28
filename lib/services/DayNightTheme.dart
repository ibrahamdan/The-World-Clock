import 'package:flutter/material.dart';

class DayNightTheme {
  final Color backgroundColor;
  final Color textColor;
  final Color buttonTextColor;
  final Gradient buttonGradient;

  DayNightTheme(
      {required this.backgroundColor,
      required this.textColor,
      required this.buttonTextColor,
      required this.buttonGradient});

  static final DayNightTheme day = DayNightTheme(
      backgroundColor: Color(0xffD9C5B2),
      textColor: Color(0xff34312D),
      buttonTextColor: Color(0xffD9C5B2),
      buttonGradient:
          LinearGradient(colors: [Color(0xff34312D), Color(0xff7E7F83)]));

  static final DayNightTheme night = DayNightTheme(
      backgroundColor: Color(0xff34312D),
      textColor: Color(0xffD9C5B2),
      buttonTextColor: Color(0xff34312D),
      buttonGradient:
          LinearGradient(colors: [Color(0xff34312D), Color(0xffF3F3F4)]));
}
