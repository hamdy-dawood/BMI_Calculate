import 'dart:math';
import 'package:flutter/material.dart';

class Brain {
  Brain({required this.h, required this.w});

  final int h;
  final double w;
  double? _bmi;

  String cal() {
    _bmi = w / pow(h / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String N() {
    if (_bmi! >= 28) {
      return ' Over body ';
    } else if (_bmi! >= 18.5 && _bmi! < 28) {
      return ' Normal body ';
    } else {
      return ' Under body ';
    }
  }

  String B() {
    if (_bmi! >= 28) {
      return 'You have a higher than normal body weight. Try to exercise more. 💪🚵🚴🏊🏇🏃';
    } else if (_bmi! >= 18.5) {
      return 'You have a Normal body weight, Good job! 🍇🍉🍍🍒🌽';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more. 🍲🍗🍒🍎';
    }
  }
}
