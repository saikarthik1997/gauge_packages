import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gauges/gauges.dart';

class GaugesPackage extends StatelessWidget {
  const GaugesPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400.0,
        width: 300.0,
        child: Stack(
          children: [
            CustomPaint(
              size: const Size(380, 300),
              painter: ArcPainter(),
            ),
            Positioned(child: Container(width:150.0,height:60.0,color: Colors.grey,),top: 120.0,left:75 ),
            RadialGauge(
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

          ],
        ),
      ),
    );
  }
}


class ArcPainter extends CustomPainter {
  ArcPainter({this.color = Colors.grey});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0,
        size.width, size.height);
    const startAngle = -3.14159;
    const sweepAngle = 3.14159;
    const useCenter = false;
    final paint1 = Paint()
      ..color = this.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.2;
    canvas.drawArc(
        rect,
        startAngle,
        sweepAngle,
        useCenter,
        paint1
          ..shader = const LinearGradient(
            colors: [
              Color(0XFFF5F5F5),
              Color(0XFFEAEAEA),
            ],
            stops: [0.5, 1.0],
          ).createShader(rect)
    );

  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}