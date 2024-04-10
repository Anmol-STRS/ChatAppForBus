import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextApp'),
        backgroundColor: Colors.cyan.shade200,
        elevation: 4,
        titleTextStyle:const TextStyle(fontSize: 25, color: Colors.white,letterSpacing: 2.5),
        centerTitle: true,
        shadowColor: Colors.black,
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(60, 10),
            bottomRight: Radius.elliptical(60, 10) 
          )
        )
      ),
    );
  }
}
