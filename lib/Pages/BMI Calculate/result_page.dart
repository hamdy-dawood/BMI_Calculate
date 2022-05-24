import 'package:bmi_calculator/Pages/Select%20Gender/gender_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Constants/constants.dart';
import '../../Drawer/drawer.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmi, this.result, this.description});

  final String? bmi;
  final String? result;
  final String? description;

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'YOUR BMI',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
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
                          color: mainColor),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: mainColor,
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
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    bmi!,
                    style: const TextStyle(
                        color: mainColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const Text(
                    'weight!',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                description!,
                style: const TextStyle(color:mainColor, fontSize: 25,height: 1.5),
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
                        height: 55.0,
                        width: 55.0,
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
                          color: mainColor,
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
                              builder: (context) => const SelectGender(),
                            ));
                      },
                      child: Container(
                        height: 70.0,
                        width: 70.0,
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
                          color: mainColor,
                          size: 40.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 55.0,
                        width: 55.0,
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
                          color: mainColor,
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
