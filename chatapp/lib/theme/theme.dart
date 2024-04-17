import 'package:chatapp/pages/loginandsignup/loginscreen.dart';
import 'package:chatapp/pages/loginandsignup/signupscreen.dart';
import 'package:chatapp/pages/spalshscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomGradientContainer extends StatelessWidget {
  final Widget child;
  final List<Color> gradientColors;
  final Alignment begin;
  final Alignment end;
  final List<double> stops;
  final BorderSide border;

  static const Color defaultGrey = Color(0xFF212121); // Equivalent to Colors.grey.shade900

  const CustomGradientContainer({
    super.key,
    required this.child,
    this.gradientColors = const [Colors.black87, defaultGrey],
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.stops = const [0.0, 1.0],
    this.border = const BorderSide(color: Colors.black),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: begin,
          end: end,
          stops: stops,
          tileMode: TileMode.clamp,
        ),
        border: Border.all(color: border.color, width: border.width),
      ),
      child: child,
    );
  }
}



class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<MyBottomNavBar> {
  int myCurrentIndex = 0;
  List pages = const [
    MainLogoScreen(),
    SignupScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 25,
              offset: const Offset(8, 20))
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
              // backgroundColor: Colors.transparent,
              selectedItemColor: Colors.redAccent,
              unselectedItemColor: Colors.black,
              currentIndex: myCurrentIndex,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.login), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorite"),
                //BottomNavigationBarItem(
                  //  icon: Icon(Icons.settings), label: "Setting"),
                //BottomNavigationBarItem(
                  //  icon: Icon(Icons.person_outline), label: "Profile"),
              ]),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}

MaterialStateColor customColor = MaterialStateColor.resolveWith((Set<MaterialState> states) {
  return const Color(0xFFF931AF);
});

