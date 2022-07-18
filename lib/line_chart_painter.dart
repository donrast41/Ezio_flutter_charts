library ezio_flutter_charts_package;
import 'package:ezio_flutter_charts_package/models/point_model.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LineChartPainter extends CustomPainter {
  final List<Point> points;
  final Color? color;
  final double? strokeWidth;
  final StrokeCap? strokeCap;

  LineChartPainter({
    required this.points,
    this.color,
    this.strokeWidth,
    this.strokeCap,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    const pointMode = ui.PointMode.polygon;
    final paint = Paint()
      ..color = color ?? Colors.purple
      ..strokeCap = strokeCap ?? StrokeCap.round
      ..strokeWidth = strokeWidth ?? 5;

    List<Offset> chardPoints = [];

    for (int i = 0; i < points.length; i++) {
      chardPoints.add(Offset(points[i].x, points[i].y));
    }

    canvas.drawPoints(
      pointMode,
      chardPoints,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
