import 'package:flutter/material.dart';

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
