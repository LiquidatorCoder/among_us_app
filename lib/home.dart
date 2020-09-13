import 'dart:math';
import 'dart:ui';

import 'package:among_us_app/starPainter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> stars(Size size) {
    var r = Random();
    List<Widget> starStack = [];
    for (int particles = 0; particles < 30; particles++) {
      double x = r.nextDouble() * size.width;
      double y = r.nextDouble() * size.height;
      double radius = r.nextDouble() * 4;
      double velocity = r.nextDouble() * 4;
      double opacity = radius / 4;
      starStack.add(
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2),
          child: CustomPaint(
            painter: StarPainter(
                x: x,
                y: y,
                radius: radius,
                velocity: velocity,
                opacity: opacity),
            child: Container(
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
      );
    }
    return starStack;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: stars(MediaQuery.of(context).size),
      ),
    );
  }
}
