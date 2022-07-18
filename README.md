
# About plugin
The package helps the developer to draw different charts on the page screen. If
the developer wants to show any data on the screen as a chart, he can use this package.

## Examples of charts
COLUMN or LINE charts builder.

![](https://github.com/donrast41/ezio_flutter_charts_package/blob/develop/photo_2022-07-18%2020.05.43.jpeg)

![](https://github.com/donrast41/ezio_flutter_charts_package/blob/develop/photo_2022-07-18%2020.05.45.jpeg)

![](https://github.com/donrast41/ezio_flutter_charts_package/blob/develop/photo_2022-07-18%2020.05.47.jpeg)

# Features

- **StrokeCap?** strokeCap - corner radius of the chart.
- **double?** strokeWidth - Width of the chart.
- **Color?** color - Color of the chart.
- **String?** label - You can add a label to the chart.

# Getting started

## pub dependency

**Dependencies:**
ezio_flutter_charts_package: ^0.0.3

## importing

**Importing:**
```import 'package:ezio_flutter_charts_package/ezio_flutter_charts_package.dart';```

# Usage

**Example:** https://github.com/donrast41/ezio_flutter_charts_package/tree/develop/example

**IMPORTANT:** Use the SizedBox with height as a parent, if you want to use Chart inside a Column, SingleChildScrollView and etc.

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

If you want to see source code, go to package git -> https://github.com/donrast41/ezio_flutter_charts_package
