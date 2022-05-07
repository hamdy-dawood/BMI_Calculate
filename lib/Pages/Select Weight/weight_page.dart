import 'package:bmi_calculator/Pages/Select%20Height/height_page.dart';
import 'package:flutter/material.dart';
import '../../Constants/constants.dart';
import '../Select Height/height_page.dart';

class SelectWeight extends StatefulWidget {
  const SelectWeight({Key? key}) : super(key: key);

  @override
  _SelectWeightState createState() => _SelectWeightState();
}

class _SelectWeightState extends State<SelectWeight> {
  double Weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'What is your weight ?',
                style: TextStyle(
                    color: MainColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: inactive,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2.0,
                        color: Colors.grey.shade300,
                        offset: const Offset(4.0, 4.0)),
                  ],
                ),
                child: Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Weight.toStringAsFixed(1),
                              style: const TextStyle(fontSize: 35, color: Colors.black),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'kg',
                              style: TextStyle(fontSize: 20, color: MainColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Slider(
                          max: 150,
                          min: 40,
                          activeColor: MainColor,
                          inactiveColor: active,
                          value: Weight,
                          onChanged: (value) {
                            setState(() {
                              Weight = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>   SelectedHeight(weight:Weight),
                        ));
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
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
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
