import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'bar_chart_sample_3.dart';

class AccueilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                '(stats local, juste pour faire joli)',
                style: TextStyle(fontSize: 35),
              ),
            ),
            const SizedBox(height: 20),
            // Ajout du graphique
            Expanded(
              child: BarChartSample3(),
            ),
          ],
        ),
      ),
    );
  }
}
