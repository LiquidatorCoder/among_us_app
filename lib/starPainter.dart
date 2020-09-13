import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  double x;
  double y;
  double radius;
  double velocity;
  double opacity;
  StarPainter(
      {@required this.x,
      @required this.y,
      @required this.radius,
      @required this.velocity,
      @required this.opacity});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white.withOpacity(opacity);
    var center = Offset(x, y);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(StarPainter oldDelegate) {
    return false;
  }
}
