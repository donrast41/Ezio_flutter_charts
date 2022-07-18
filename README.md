COLUMN or LINE charts builder.

# Features

StrokeCap? strokeCap - corner radius of the chart;
double? strokeWidth - Width of the chart;
Color? color - Color of the chart;
String? label - You can add a label to the chart;

# Getting started

## pub dependency

dependencies:
ezio_flutter_charts_package: ^<version number>

## importing

importing:
import 'package:ezio_flutter_charts_package/ezio_flutter_charts_package.dart';

# Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
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
```

# Additional information

If you want to see source code, go to package git -> 
