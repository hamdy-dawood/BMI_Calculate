import 'package:bmi_calculator/Pages/Select%20Gender/gender_page.dart';
import 'package:flutter/material.dart';
import '../../Constants/constants.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                height: 200.0,
                width: 200.0,
                child: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            height: 200.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectGender(),
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
                  'Start',
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
    );
  }
}
