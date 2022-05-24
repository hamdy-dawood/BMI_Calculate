import 'package:bmi_calculator/Constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../main.dart';
import '../ForgetPasswordScreen/forget_password.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showSignUpPage;

  const LoginScreen({Key? key, required this.showSignUpPage})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    showDialog(context: context,
        barrierDismissible: false, builder: (context) =>
        const Center(
          child: CircularProgressIndicator(color: mainColor,strokeWidth: 5),
        ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (error) {
      print(error);
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: error.message.toString(),
        ),
      );
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      'Hey,\nLogin Now.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text('if you are new/',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 13)),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: widget.showSignUpPage,
                          child: const Text('Create New',
                              style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (_emailController) {
                        print(_emailController);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'email must be not empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: mainColor,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: mainColor,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Email',
                          hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 15),
                          prefixIcon: const Icon(
                            FontAwesomeIcons.solidEnvelope,
                            size: 20,
                            color: mainColor,
                          ),
                          border: InputBorder.none),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      onChanged: (_passwordController) {
                        print(_passwordController);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'password must be not empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: mainColor,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: mainColor,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Password',
                          hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 15),
                          prefixIcon: const Icon(
                            FontAwesomeIcons.solidEnvelope,
                            size: 20,
                            color: mainColor,
                          ),
                          border: InputBorder.none),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Forgot Password?/',
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 13)),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return ForgetPassword();
                                }));
                          },
                          child: const Text('Reset',
                              style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          print(_emailController);
                          print(_passwordController);
                          signIn();
                        }
                      },
                      child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: mainColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: mainColor,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                )
                              ]),
                          child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Text(
                          'Or connect using',
                          style: TextStyle(color: Colors.grey[700]),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/icons/facebook.png',
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/icons/apple.png',
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/icons/google.png',
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
