import 'dart:math';
import 'package:among_us_app/globals.dart' as globals;
import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  const StarPainter();
  @override
  void paint(Canvas canvas, Size size) {
    if (globals.particlesInfo.isNotEmpty) {
      var paint = Paint();
      var center = Offset.zero;
      for (int particles = 0; particles < 30; particles++) {
        center = globals.particlesInfo[particles][1];
        double radius = globals.particlesInfo[particles][0];
        // double velocity = r.nextDouble() * 4;
        double opacity = radius > 2 ? radius / 4 : 0.7;
        paint.color = Colors.white.withOpacity(opacity);
        canvas.drawCircle(center, radius, paint);
      }
    } else {
      var paint = Paint();
      var r = Random();
      var center = Offset.zero;
      for (int particles = 0; particles < 30; particles++) {
        double x = r.nextDouble() * size.width;
        double y = r.nextDouble() * size.height;
        center = Offset(x, y);
        double radius = r.nextDouble() * 4;
        // double velocity = r.nextDouble() * 4;
        double opacity = radius > 2 ? radius / 4 : 0.7;
        paint.color = Colors.white.withOpacity(opacity);
        canvas.drawCircle(center, radius, paint);
        globals.particlesInfo.addAll({
          particles: [radius, center]
        });
      }
    }
  }

  @override
  bool shouldRepaint(StarPainter oldDelegate) {
    return false;
  }

  @override
  bool shouldRebuildSemantics(StarPainter oldDelegate) {
    return false;
  }
}

class Stars extends StatelessWidget {
  Stars();
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const StarPainter(),
      child: Container(
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
