library ezio_flutter_charts_package;
import 'package:ezio_flutter_charts_package/line_chart_painter.dart';
import 'package:ezio_flutter_charts_package/models/point_model.dart';
import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  final List<Point> axisPoints;
  final List<Point> chartPoints;
  final String? label;
  final Color? color;
  final double? strokeWidth;
  final StrokeCap? strokeCap;
  final BuildContext context;

  const LineChart({
    Key? key,
    required this.axisPoints,
    required this.chartPoints,
    required this.context,
    this.label,
    this.color,
    this.strokeWidth,
    this.strokeCap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final gh = constraints.maxHeight; //grid height
      final gw = constraints.maxWidth; //grid width
      return Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: gh * 0.1,
            child: label == null ? Container() : Text(label!),
          ),
          Center(
            child: chartGrid(
              gh,
              gw,
              context,
              axisPoints,
            ),
          ),
          linePainter(
            color: color,
            strokeWidth: strokeWidth,
            strokeCap: strokeCap,
            chartPoints: percentageCalculation(
              firstAxisPoint: axisPoints.first,
              lastAxisPoint: axisPoints.last,
              chartPoints: chartPoints,
              height: gh * 0.7 + 1,
              width: gw * 0.9 + 1,
            ),
            gh: gh,
            gw: gw,
          ),
          Positioned(
            top: gh * 0.365,
            left: gw * 0.02,
            child: axisXLabels(
              gh,
              gw,
              context,
              axisPoints,
            ),
          ),
          Positioned(
            top: gh * 0.141,
            right: gw * 0.46,
            child: axisYLabels(
              gh,
              gw,
              context,
              axisPoints,
            ),
          )
        ],
      );
    });
  }

  Widget axisXLabels(double gh, double gw, BuildContext context, List<Point> points) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SizedBox(
        height: gh,
        width: gw,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: points.length,
            itemBuilder: (_, i) {
              return Row(
                children: [
                  SizedBox(
                    width: gw * 0.1,
                    height: gh * 0.02,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        points[i].x.toString().split('.')[0],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  if (i == 0)
                    SizedBox(
                      width: gw * 0.8 / (points.length - 1) - gw * 0.1,
                    )
                  else if (i == points.length - 2 && points.length > 3)
                    SizedBox(
                      width: gw * 0.8 / (points.length - 1) - gw * 0.1,
                    )
                  else if (i == points.length - 1)
                      Container()
                    else
                      SizedBox(
                        width: gw * 0.9 / (points.length - 1) - gw * 0.1,
                      )
                ],
              );
            }),
      ),
    );
  }

  Widget axisYLabels(double gh, double gw, BuildContext context, List<Point> points) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: SizedBox(
        height: gh,
        width: gw,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: points.length,
            itemBuilder: (_, i) {
              return Column(
                children: [
                  SizedBox(
                    height: gh * 0.05,
                    child: Text(
                      points.reversed.toList()[i].y.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  if (i == points.length - 1)
                    Container()
                  else
                    SizedBox(
                      height: gh * 0.7 / (points.length - 1) - gh * 0.05,
                    )
                ],
              );
            }),
      ),
    );
  }

  Widget chartGrid(double gh, double gw, BuildContext context, List<Point> points) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: gh * 0.7 + 1,
        width: gw * 0.9 + 1,
        color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: gh,
                width: gw,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: points.length,
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        axisXLines(context),
                        SizedBox(
                          height: gh * 0.7 / (points.length - 1) - 1,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: gh,
                width: gw,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: points.length,
                  itemBuilder: (_, i) {
                    return Row(
                      children: [
                        axisYLines(context),
                        if (i == points.length - 1)
                          Container()
                        else
                          SizedBox(
                            width: gw * 0.9 / (points.length - 1) - 1,
                          )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget linePainter({
    required List<Point> chartPoints,
    required double gw,
    required double gh,
    final Color? color,
    final double? strokeWidth,
    final StrokeCap? strokeCap,
  }) {
    return Container(
      color: Colors.transparent,
      height: gh * 0.7 + 1,
      width: gw * 0.9 + 1,
      child: CustomPaint(
        foregroundPainter: LineChartPainter(
          points: chartPoints,
          color: color,
          strokeCap: strokeCap,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }

  Widget axisXLines(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 1,
    );
  }

  Widget axisYLines(BuildContext context) {
    return Container(
      color: Colors.black12,
      width: 1,
    );
  }

  List<Point> percentageCalculation({
    required Point firstAxisPoint,
    required Point lastAxisPoint,
    required List<Point> chartPoints,
    required double height,
    required double width,
  }) {
    final List<Point> calculatedList = [];
    final lastXAxisPointSubtracted = lastAxisPoint.x - firstAxisPoint.x;
    final lastYAxisPointSubtracted = lastAxisPoint.y - firstAxisPoint.y;
    for (int i = 0; i < chartPoints.length; i++) {
      final chartXAxisPointSubtracted = chartPoints[i].x - firstAxisPoint.x;
      final chartYAxisPointSubtracted = chartPoints[i].y - firstAxisPoint.y;
      final percentXAxisPoint = chartXAxisPointSubtracted / lastXAxisPointSubtracted;
      final percentYAxisPoint = chartYAxisPointSubtracted / lastYAxisPointSubtracted;
      final resultXChartPoint = width * percentXAxisPoint + 10;
      final resultYChartPoint = height - height * percentYAxisPoint;
      calculatedList.add(Point(x: resultXChartPoint, y: resultYChartPoint));
    }
    return calculatedList;
  }
}
