// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'imc_gauge_range.dart';

class ImcGauge extends StatelessWidget {
  final double imc;
  const ImcGauge({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          minimum: 0.0,
          maximum: 1.4,
          ranges: [
            ImcGaugeRange(
              color: Colors.red,
              start: 0.0,
              end: 0.7,
              label: 'Alcool',
            ),
            ImcGaugeRange(
              color: Colors.blue,
              start: 0.7,
              end: 1.4,
              label: 'Gasolina',
            ),

            // ImcGaugeRange(
            //   color: Colors.yellow,
            //   start: 24.5,
            //   end: 29.9,
            //   label: 'SOBREPESO',
            // ),
            // ImcGaugeRange(
            //   color: Colors.red[500]!,
            //   start: 29.9,
            //   end: 39.9,
            //   label: 'OBESIDADE',
            // ),
            // ImcGaugeRange(
            //   color: Colors.red[900]!,
            //   start: 39.9,
            //   end: 47.9,
            //   label: 'OBESIDADE GRAVE',
            // ),
          ],
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            )
          ],
        ),
      ],
    );
  }
}
