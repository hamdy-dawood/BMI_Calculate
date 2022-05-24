import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Auth/auth_page.dart';
import 'Pages/Select Gender/gender_page.dart';
import 'Splash Screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const BMI());
}

final navigatorKey = GlobalKey<NavigatorState>();

class BMI extends StatelessWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const Spalsh_Screen(),
    );
  }
}
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          {
          if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'),);
          }
          else if (snapshot.hasData) {
              return const SelectGender();
            } else {
              return const AuthPage();
            }
          }
        },
      ), // StreamBuilder
    ); // Scaffold
  }
}
