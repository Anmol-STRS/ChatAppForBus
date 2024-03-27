import 'package:flutter/material.dart';

const String signuproute = '/signup';

class signuppage extends StatefulWidget {
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: TextButton(
              onPressed: () => showDialog(
                context: context, // Assuming you have a context variable
                builder: (context) => AlertDialog(
                  title: const Text('Sign Up'), // Add a title
                  content: const Text('Hey sign up'),
                  actions: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(context), // Close the dialog
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
              child: const Text('Sign Up'), // Button text
            ),
          )
        ],
      ),
    );
  }
}
