import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class ChartFlutter extends StatefulWidget {
  const ChartFlutter({Key? key}) : super(key: key);

  @override
  _ChartFlutterState createState() => _ChartFlutterState();
}

class _ChartFlutterState extends State<ChartFlutter> {
  List<CounterData>? _chartData;
  TooltipBehavior? _tooltipBehavior;

  @override
  initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(text: 'Top of Message Request'),
      legend: Legend(
        position: LegendPosition.bottom,
        isVisible: true,
        overflowMode: LegendItemOverflowMode.scroll,
      ),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        DoughnutSeries<CounterData, String>(
          //   maximumValue: 10,
          dataSource: _chartData,
          xValueMapper: (CounterData data, _) => data.title,
          yValueMapper: (CounterData data, _) => data.count,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
          enableTooltip: true,
        ),
      ],
    );
  }

  List<CounterData> getChartData() {
    final List<CounterData> chartData = [
      CounterData(title: 'HIGH', count: 10),
      CounterData(title: 'MEDUIM', count: 3),
    ];
    return chartData;
  }
}

class CounterData {
  final String title;
  final int count;
  CounterData({
    required this.title,
    required this.count,
  });
}
