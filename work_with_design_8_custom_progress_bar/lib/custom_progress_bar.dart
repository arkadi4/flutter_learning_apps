

import 'dart:math';
import 'package:flutter/material.dart';

class CustomProgressBar extends CustomPainter {
  double progress;

  CustomProgressBar({
    required this.progress
  });

  @override
  void paint(Canvas canvas, Size size) {

    final paint1 = Paint();
    paint1.color = Color.fromRGBO(153, 195, 200, 1);
    paint1.style = PaintingStyle.stroke;
    paint1.strokeWidth = 10;
    canvas.drawCircle(Offset(size.width/2, size.width/2), size.width/2, paint1);

    final paint2 = Paint();
    paint2.color = Color.fromRGBO(49, 137, 144, 1);
    paint2.style = PaintingStyle.stroke;
    paint2.strokeWidth = 20;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width/2, size.width/2), radius: size.width/2),
      -pi/2,
      2*pi * progress,
      false,
      paint2);
  }

  @override
  bool shouldRepaint(covariant CustomProgressBar oldDelegate) {
    return true;
  }
}