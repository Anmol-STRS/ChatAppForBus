import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  List<Color> bgcolors = [
    Color.fromRGBO(39, 40, 41, 1),
    Color.fromRGBO(97, 103, 122, 0.99),
    Color.fromRGBO(34, 40, 49, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('TextApp'),
        backgroundColor: Colors.grey.shade600,
        surfaceTintColor: Colors.black,
        elevation: 4,
        titleTextStyle: const TextStyle(
        fontSize: 25, color: Colors.white, letterSpacing: 2.5, ),
        centerTitle: true,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(60, 10),
            bottomRight: Radius.elliptical(60, 10),
          ),
        ),
        leading: const Icon(Icons.mark_unread_chat_alt_sharp, size: 30, color: Colors.black,)//const Icon(Icons.mark_unread_chat_alt_sharp,textDirection: TextDirection.rtl),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black87,
                  Colors.grey.shade900,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
              border: Border.all(color: Colors.black))),
    );
  }
}
