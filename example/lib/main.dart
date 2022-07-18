import 'package:ezio_flutter_charts_package/ezio_flutter_charts_package.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Charts',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter Charts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  ///Heart example
  final List<Point> chartHeartPoints = [
    Point(x: 4, y: 10),
    Point(x: 1, y: 20),
    Point(x: 1, y: 25),
    Point(x: 2, y: 30),
    Point(x: 3, y: 30),
    Point(x: 4, y: 25),
    Point(x: 5, y: 30),
    Point(x: 6, y: 30),
    Point(x: 7, y: 25),
    Point(x: 7, y: 20),
    Point(x: 4, y: 10),
  ];

  ///Column chart example
  final List<Point> chartPoints = [
    Point(x: 0, y: 10),
    Point(x: 1, y: 15),
    Point(x: 2, y: 23),
    Point(x: 3, y: 30),
    Point(x: 4, y: 13),
    Point(x: 5, y: 20),
    Point(x: 6, y: 25),
    Point(x: 7, y: 25),
    Point(x: 8, y: 38),
  ];

  ///Axis points example
  final List<Point> axesPoints = [
    Point(x: 0, y: 0),
    Point(x: 1, y: 5),
    Point(x: 2, y: 10),
    Point(x: 3, y: 15),
    Point(x: 4, y: 20),
    Point(x: 5, y: 25),
    Point(x: 6, y: 30),
    Point(x: 7, y: 35),
    Point(x: 8, y: 40),
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: ColumnChart(
                color: Colors.purple,
                strokeWidth: 4,
                strokeCap: StrokeCap.butt,
                label: 'Column chart',
                chartPoints: widget.chartPoints,
                axisPoints: widget.axesPoints,
                context: context,
              ),
            ),
            SizedBox(
              height: 600,
              child: LineChart(
                color: Colors.orange,
                strokeWidth: 3,
                label: 'Line chart',
                chartPoints: widget.chartPoints,
                axisPoints: widget.axesPoints,
                context: context,
              ),
            ),
            SizedBox(
              height: 600,
              child: LineChart(
                color: Colors.pinkAccent,
                strokeWidth: 3,
                label: 'Line chart',
                chartPoints: widget.chartHeartPoints,
                axisPoints: widget.axesPoints,
                context: context,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
