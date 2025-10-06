import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SummaryScreen extends StatelessWidget {
  final String name;
  final int age;
  final int steps;
  final double water;
  final double sleep;

  SummaryScreen({
    required this.name,
    required this.age,
    required this.steps,
    required this.water,
    required this.sleep,
  });

  @override
  Widget build(BuildContext context) {
    final List<BarChartGroupData> barData = [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(toY: steps.toDouble(), color: Colors.blue, width: 22)
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(toY: water, color: Colors.green, width: 22)
        ],
        showingTooltipIndicators: [0],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(toY: sleep, color: Colors.orange, width: 22)
        ],
        showingTooltipIndicators: [0],
      ),
    ];

    double maxY =
        [steps.toDouble(), water, sleep].reduce((a, b) => a > b ? a : b) * 1.2;

    return Scaffold(
      appBar: AppBar(title: const Text('Health Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: ListTile(
                title: Text('Name: $name'),
                subtitle: Text(
                    'Age: $age\nSteps: $steps\nWater: $water L\nSleep: $sleep hours'),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: maxY,
                  barGroups: barData,
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 36,
                        getTitlesWidget: (value, meta) {
                          // ✅ fl_chart 1.1.1 no axisSide needed
                          String text;
                          if (value.toInt() == 0) text = 'Steps';
                          else if (value.toInt() == 1) text = 'Water';
                          else if (value.toInt() == 2) text = 'Sleep';
                          else text = '';
                          return Center(
                              child: Text(
                            text,
                            style: const TextStyle(fontSize: 14),
                          ));
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.toY}',
                          const TextStyle(color: Colors.black),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
