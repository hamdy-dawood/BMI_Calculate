import 'package:bmi_calculator/Account/LoginScreen/login_screen.dart';
import 'package:bmi_calculator/Account/SignupScreen/signup_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initially, show login page
  bool showLoginPage = true;

  void toggleScreens(){
    setState((){
      showLoginPage =!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
   if(showLoginPage){
     return LoginScreen(showRegisterPage: toggleScreens);
   }else{
     return SignupScreen(showLoginPage:toggleScreens);
   }
  }
}
