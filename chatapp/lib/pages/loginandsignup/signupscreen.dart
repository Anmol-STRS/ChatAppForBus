import 'dart:developer';

import 'package:chatapp/pages/database.dart';
import 'package:chatapp/pages/theme/theme.dart';
import 'package:chatapp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

bool isSignUp = false;
final FirebaseAuthService _auth = FirebaseAuthService();

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _finalpasswordController =
      TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _finalpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            title: const Text('Signup'),
            backgroundColor: Colors.grey.shade600,
            surfaceTintColor: Colors.black,
            elevation: 4,
            titleTextStyle: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              letterSpacing: 2.5,
            ),
            centerTitle: true,
            shadowColor: Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(60, 10),
                bottomRight: Radius.elliptical(60, 10),
              ),
            ),
            leading: GestureDetector(
              onDoubleTap: () => {_goBackToMainScreen(context)},
              child: const Icon(
                Icons.person_2_outlined,
                size: 30,
                color: Colors.black,
              ),
            )),
        body: CustomGradientContainer(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(children: [
                          Material(
                            borderRadius: BorderRadius.circular(25),
                            shadowColor: Colors.white70,
                            color: Colors.white,
                            elevation: 8,
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(width: 2),
                                ),
                                labelText: 'Email Address',
                                hintText: 'Enter your email',
                                prefixIcon:
                                    const Icon(Icons.mail_lock_outlined),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Material(
                            borderRadius: BorderRadius.circular(25),
                            shadowColor: Colors.white70,
                            color: Colors.white,
                            elevation: 8,
                            child: TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(width: 2),
                                ),
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                prefixIcon: const Icon(Icons.password_outlined),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                              obscureText: true,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Material(
                            borderRadius: BorderRadius.circular(25),
                            shadowColor: Colors.white70,
                            color: Colors.white,
                            elevation: 8,
                            child: TextField(
                              controller: _finalpasswordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(width: 2),
                                ),
                                labelText: 'Confirm Password',
                                hintText: 'Confirm your password',
                                prefixIcon: const Icon(Icons.password_outlined),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                              ),
                              obscureText: true,
                            ),
                          ),
                        ])),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_passwordController.text ==
                        _finalpasswordController.text) {
                      addData(_emailController.text, _passwordController.text,
                          _finalpasswordController);
                      _signUp();
                    } else {
                      // Passwords don't match, show a popup dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            backgroundColor: Colors.white,
                            content: const Text('Your Passwords do not match.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ));
  }

  void _signUp() async {
    setState(() {
      isSignUp = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSignUp = false;
    });
    if (user != null) {
      log("User is successfully created");
      _goBackToMainScreen(context);
    } else {
      log('Some error happend');
    }
  }
}

void _goBackToMainScreen(BuildContext context) {
  Navigator.pop(context);
}
