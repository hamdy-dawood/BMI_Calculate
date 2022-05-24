import 'package:flutter/material.dart';
import '../Account/LoginScreen/login_screen.dart';
import '../Account/SignupScreen/signup_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(
          showSignUpPage: toggle,
        )
      : SignupScreen(
          showLoginPage: toggle,
        );
  void toggle()=> setState(()=> isLogin =!isLogin );
}
