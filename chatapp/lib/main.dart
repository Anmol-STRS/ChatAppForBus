import 'package:flutter/material.dart';
import '';

void main() {
  runApp(MaterialApp(
    title: 'My App', // App title
    initialRoute: '/', // Set the initial route (optional)
    routes: {
      '/': (context) => const homepage(), // Home page route (optional)
      signuppage.signupRoute: (context) => const signuppage(), // Signup route
    },
  ));
}
