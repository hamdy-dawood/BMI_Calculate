import 'package:bmi_calculator/Constants/constants.dart';
import 'package:bmi_calculator/Pages/Select%20Gender/gender_page.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Spalsh_Screen extends StatefulWidget {
  const Spalsh_Screen({Key? key}) : super(key: key);

  @override
  State<Spalsh_Screen> createState() => _Spalsh_ScreenState();
}

class _Spalsh_ScreenState extends State<Spalsh_Screen> {
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 7000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>const SelectGender()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        "assets/photos/logo.png",
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    height: 250,
                  ),
                  LoadingAnimationWidget.inkDrop(color: MainColor, size: 50),
                ],
              ),
            ),
          ],
        ));
  }
}
