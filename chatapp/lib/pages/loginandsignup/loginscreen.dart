import 'dart:developer';

import 'package:chatapp/pages/loginandsignup/signupscreen.dart';
import 'package:chatapp/pages/theme/theme.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/services/notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool result = false;
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  LocalNotificationService ls = LocalNotificationService();

  void _login() {
    // Implement your login logic here
    String email = _emailController.text;
    String password = _passwordController.text;
    // You can perform validations or authenticate the user here
    log('Email: $email, Password: $password');
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
      body: CustomGradientContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                              fillColor: Colors.white,
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              prefixIcon:
                                  const Icon(Icons.alternate_email_sharp),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 16),
                        // Login Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () => _signIn(),
                              style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shadowColor: Colors.white),
                              child: const Text('Login'),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () async => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupScreen())),
                                            ls.showNotificationAndroid('Signup', 'High')
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black),
                              child: const Text('Signup'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      log("User is successfully signed in");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sign In Successful'),
            content: const Text('You have successfully signed in.'),
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
    } else {
      // Some error occurred during sign-in
      log("Some error occurred");
    }
  }
}
