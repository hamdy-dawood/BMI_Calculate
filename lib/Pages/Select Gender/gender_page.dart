import 'package:flutter/material.dart';
import '../../Constants/constants.dart';
import '../Select Weight/weight_page.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({Key? key}) : super(key: key);

  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  Gender? g;

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
                'Select your Gender !',
                style: TextStyle(
                    color: MainColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          g = Gender.Male;
                        });
                      },
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                            color: g == Gender.Male ? active : inactive,
                            border: Border.all(color:MainColor,width: 2.0),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            SizedBox(
                                height: 150,
                                width: 150,
                                child: Image.asset(
                                  "assets/Male.png",
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Male',
                              style: TextStyle(color: Colors.black, fontSize: 25,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          g = Gender.Female;
                        });
                      },
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                            color: g == Gender.Female ? active : inactive,
                            border: Border.all(color:MainColor,width: 2.0),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            SizedBox(
                                height: 150,
                                width: 150,
                                child: Image.asset(
                                  "assets/Female.png",
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Female',
                              style: TextStyle(color: Colors.black, fontSize: 25,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                          builder: (context) => const SelectWeight(),
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
