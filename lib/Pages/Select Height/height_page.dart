import 'package:bmi_calculator/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:height_slider/height_slider.dart';
import '../../Drawer/drawer.dart';
import '../BMI Calculate/bmi_result.dart';
import '../BMI Calculate/result_page.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({Key? key, required this.weight}) : super(key: key);
  final double weight ;

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  int height = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 30.0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: SizedBox(
                height: 30.0,
                width: 30.0,
                child: Image.asset(
                  "assets/icons/list.png",
                  fit: BoxFit.fill,
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: SizedBox(
                height: 25.0,
                width: 25.0,
                child: Image.asset(
                  "assets/icons/bell.png",
                  color: Colors.black,
                )),
            onPressed: () {},
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'What is your Height ?',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 450,
                child: HeightSlider(
                  height: height,
                  onChange: (val) => setState(() => height = val),
                  unit: 'cm',
                  maxHeight: 200,
                  minHeight: 130,
                  primaryColor: mainColor,
                  sliderCircleColor: mainColor,
                  numberLineColor: Colors.black,
                  currentHeightTextColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 40
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
                      color: mainColor,
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
