import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/pages/mainscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/pages/signupscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'My App', // App title
    initialRoute: '/',
    routes: {
      '/': (context) => const MainPageScreen(),
    },
  ));
}
