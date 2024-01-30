import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGaugeRange extends GaugeRange {
  ImcGaugeRange({
    super.key,
    required Color color,
    required double start,
    required double end,
    required String label,
  }) : super(
          startValue: start,
          endValue: end,
          color: color,
          label: label,
          sizeUnit: GaugeSizeUnit.factor,
          labelStyle: const GaugeTextStyle(fontFamily: 'Arial', fontSize: 16),
          startWidth: 0.70,
          endWidth: 0.70,
        );
}
