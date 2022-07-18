library ezio_flutter_charts_package;
import 'package:ezio_flutter_charts_package/models/point_model.dart';
import 'package:flutter/material.dart';

class ColumnChartPainter extends CustomPainter {
  final List<Point> points;
  final Color? color;
  final double? strokeWidth;
  final StrokeCap? strokeCap;

  ColumnChartPainter({
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
    final paint = Paint()
      ..color = color ?? Colors.purple
      ..strokeCap = strokeCap ?? StrokeCap.butt
      ..strokeWidth = strokeWidth ?? 10;

    for (int i = 0; i < points.length; i++) {
      canvas.drawLine(
        Offset(
            i == 0
                ? points[i].x + (strokeWidth ?? 10) / 2
                : i == points.length - 1
                    ? points[i].x - (strokeWidth ?? 10) / 2
                    : points[i].x,
            size.height),
        Offset(
            i == 0
                ? points[i].x + (strokeWidth ?? 10) / 2
                : i == points.length - 1
                    ? points[i].x - (strokeWidth ?? 10) / 2
                    : points[i].x,
            points[i].y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
