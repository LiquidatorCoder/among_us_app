import 'dart:math';

import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  int particles;
  StarPainter({@required this.particles});
  @override
  void paint(Canvas canvas, Size size) {
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
    }
  }

  @override
  bool shouldRepaint(StarPainter oldDelegate) {
    return false;
  }
}
