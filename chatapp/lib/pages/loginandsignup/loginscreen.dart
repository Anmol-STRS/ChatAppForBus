import 'dart:developer';

import 'package:chatapp/pages/database.dart';
import 'package:chatapp/pages/loginandsignup/signupscreen.dart';
import 'package:chatapp/pages/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:getwidget/components/badge/gf_icon_badge.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Implement your login logic here
    String email = _emailController.text;
    String password = _passwordController.text;
    // You can perform validations or authenticate the user here
    log('Email: $email, Password: $password');
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
                              floatingLabelBehavior: FloatingLabelBehavior.never,
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
                              floatingLabelBehavior: FloatingLabelBehavior.never,
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
                              onPressed: () => readData(),
                              style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  shadowColor: Colors.white
                                  ),
                              child: const Text('Login'),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignupScreen())),
                              style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black
                                  ),
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
}
