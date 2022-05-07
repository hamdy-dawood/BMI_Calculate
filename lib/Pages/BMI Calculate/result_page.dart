import 'dart:math';
import 'package:bmi_calculator/Pages/Start%20Page/start_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Constants/constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmi, this.result, this.description});

  final String? bmi;
  final String? result;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'YOUR BMI',
                style: TextStyle(
                    color: MainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: inactive,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2.0,
                        color: Colors.grey.shade300,
                        offset: const Offset(4.0, 4.0)),
                  ],
                ),
                child: Center(
                  child: CircularPercentIndicator(
                    radius: 100,
                    animation: true,
                    animationDuration: 1200,
                    lineWidth: 20.0,
                    percent: double.parse(result!) / 90,
                    center: Text(
                      result!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          color: MainColor),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: MainColor,
                    backgroundColor: active,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text(
                    'You have',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    bmi!,
                    style: const TextStyle(
                        color: MainColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'weight!',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                description!,
                style: const TextStyle(color:MainColor, fontSize: 25,height: 1.5),
              )),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: inactive,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.0,
                                color: Colors.grey.shade300,
                                offset: const Offset(4.0, 4.0)),
                          ],
                        ),
                        child: const Icon(
                          FontAwesomeIcons.solidBookmark,
                          color: MainColor,
                          size: 25.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StartPage(),
                            ));
                      },
                      child: Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: inactive,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.0,
                                color: Colors.grey.shade300,
                                offset: const Offset(4.0, 4.0)),
                          ],
                        ),
                        child: const Icon(
                          FontAwesomeIcons.house,
                          color: MainColor,
                          size: 40.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: inactive,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.0,
                                color: Colors.grey.shade300,
                                offset: const Offset(4.0, 4.0)),
                          ],
                        ),
                        child: const Icon(
                          FontAwesomeIcons.share,
                          color: MainColor,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
