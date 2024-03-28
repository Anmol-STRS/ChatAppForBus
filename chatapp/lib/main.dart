import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widgetsforapp/signupscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'My App', // App title
    initialRoute: '/',
    routes: {
      '/': (context) => const signuppage(),
    },
  ));
}
