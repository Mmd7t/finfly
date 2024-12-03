import 'dart:math';

import 'package:flutter/material.dart';
import 'package:finfly/config/constants/app_colors.dart';

class CirclePaginationPainter extends CustomPainter {
  final double radius;

  CirclePaginationPainter(this.radius);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    double angle = 2 * pi * radius;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        height: size.height,
        width: size.width,
      ),
      -pi / 2,
      angle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CirclePaginationPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CirclePaginationPainter oldDelegate) => true;
}
