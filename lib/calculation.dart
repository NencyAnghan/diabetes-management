import 'package:flutter/material.dart';
import 'dart:math';

class Calculation {
  Calculation({this.level});

  final int level;

  // String getResult() {
  //   if (_BMI > 25) {
  //     return 'Overweight';
  //   } else if (_BMI > 18.5) {
  //     return 'Normal';
  //   } else {
  //     return 'UnderWeight';
  //   }
  // }
  String getInterpretation() {
    if (level > 0 && level <= 30) {

    } else if (level > 30 && level <= 120) {

    } else if (level > 120 && level <= 240) {

    } else if (level > 240 && level <= 300) {

    } else {

    }
  }


}

