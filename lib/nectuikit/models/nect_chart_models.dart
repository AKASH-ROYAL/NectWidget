import '../Nect_color.dart';
import 'package:flutter/material.dart';

enum NectChartType { LINE, BAR, PIE, DOUGHNUT }

class NectLineChartDataset {
  final String label;
  final List<double> data;
  final Color lineColor;
  final Color pointColor;
  final Color fillColor;
  final double tension;
  final Color pointColorBackground;

  NectLineChartDataset(
      {required this.label,
      required this.data,
      this.lineColor = NectColor.Gray11,
      this.pointColor = NectColor.Gray11,
      this.fillColor = Colors.transparent,
      this.tension = 0.1,
      this.pointColorBackground = Colors.white});
}

class NectBarChartDataset {
  final String label;
  final List<double> data;
  final Color fillColor;

  NectBarChartDataset(
      {required this.label,
      required this.data,
      this.fillColor = NectColor.Blue3});
}

class NectPieChartDataset {
  final String label;
  final List<double> data;
  final List<Color> fillColors;

  NectPieChartDataset(
      {required this.label, required this.data, required this.fillColors});
}

class NectDoughnutDataset {
  final String label;
  final List<double> data;
  final List<Color> fillColors;

  NectDoughnutDataset(
      {required this.label, required this.data, required this.fillColors});
}
