import 'package:bmi_calculator/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../main.dart';


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
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
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
                  LoadingAnimationWidget.inkDrop(color: mainColor, size: 50),
                ],
              ),
            ),
          ],
        ));
  }
}
