import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';

class Gaugespackage extends StatelessWidget {
  const Gaugespackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300.0,
        width: 300.0,
        child: RadialGauge(
          radius: 150,
          axes: [
            RadialGaugeAxis(
                minValue: 0,
                maxValue: 100,
                minAngle: -90,
                maxAngle: 90,
                segments: [
                  const RadialGaugeSegment(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(8.0)),
                    minValue: 0,
                    maxValue: 33,
                    minAngle: -90,
                    maxAngle: -30,
                    color: Colors.red,
                  ),
                  const RadialGaugeSegment(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(8.0)),
                    minValue: 34,
                    maxValue: 66,
                    minAngle: -30,
                    maxAngle: 30,
                    color: Colors.yellow,
                  ),
                  const RadialGaugeSegment(
                    minValue: 66,
                    maxValue: 100,
                    minAngle: 30,
                    maxAngle: 90,
                    color: Colors.green,
                  ),
                ],
                pointers: [
                  RadialNeedlePointer(
                    value: 70,
                    thicknessStart: 30,
                    thicknessEnd: 0,
                    length: 0.9,
                    knobRadiusAbsolute: 18,
                    gradient: LinearGradient(
                      colors: [
                        Color(Colors.grey[400]!.value),
                        Color(Colors.grey[400]!.value),
                        Color(Colors.grey[600]!.value),
                        Color(Colors.grey[600]!.value)
                      ],
                      stops: const [0, 0.5, 0.5, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
