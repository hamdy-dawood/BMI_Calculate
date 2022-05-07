import 'dart:math';
import 'package:bmi_calculator/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:height_slider/height_slider.dart';

import '../BMI Calculate/bmi_result.dart';
import '../BMI Calculate/result_page.dart';

class SelectedHeight extends StatefulWidget {
  const SelectedHeight({Key? key, required this.weight}) : super(key: key);
  final double weight ;

  @override
  State<SelectedHeight> createState() => _SelectedHeightState();
}

class _SelectedHeightState extends State<SelectedHeight> {
  int height = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'What is your Height ?',
                style: TextStyle(
                    color: MainColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 500,
                child: HeightSlider(
                  height: height,
                  onChange: (val) => setState(() => height = val),
                  unit: 'cm',
                  maxHeight: 200,
                  minHeight: 130,
                  primaryColor: MainColor,
                  sliderCircleColor: MainColor,
                  numberLineColor: Colors.black,
                  currentHeightTextColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75.0),
                child: GestureDetector(
                  onTap: () {
                    Brain b = Brain(h: height, w: widget.weight);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResultPage( result: b.cal(),bmi: b.N(), description: b.B())));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: MainColor,
                    ),
                    child: const Center(
                        child: Text(
                          'Calculate',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
