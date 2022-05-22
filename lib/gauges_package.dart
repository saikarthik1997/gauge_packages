import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gauges/gauges.dart';

class GaugesPackage extends StatelessWidget {
  const GaugesPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              GaugeWidget(),
              SizedBox(
                width: 50.0,
              ),
              GaugeWidget()
            ],
          ),
          const SizedBox(height: 40.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              GaugeWidget(),
              SizedBox(
                width: 50.0,
              ),
              GaugeWidget()
            ],
          ),
        ],
      ),
    );
  }
}

class GaugeWidget extends StatelessWidget {
  const GaugeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: const Size(300, 300),
          painter: ArcPainter(),
        ),
        Positioned(
            child: Container(
              child: SvgPicture.asset("assets/arrow_base.svg",
                  height: 90.0, width: 90.0)
              // width:150.0,height:60.0
              ,
            ),
            top: 95.0,
            left: 80.0),
        Positioned(
          bottom: 47,
          left: 45.0,
          child: RadialGauge(
            radius: 105,
            axes: [
              RadialGaugeAxis(
                  minValue: 0,
                  maxValue: 100,
                  minAngle: -90,
                  maxAngle: 90,
                  segments: [
                    const RadialGaugeSegment(
                      widthAbsolute: 40.0,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(8.0)),
                      minValue: 0,
                      maxValue: 33,
                      minAngle: -90,
                      maxAngle: -30,
                      color: Colors.red,
                    ),
                    const RadialGaugeSegment(
                      widthAbsolute: 40.0,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(8.0)),
                      minValue: 34,
                      maxValue: 66,
                      minAngle: -30,
                      maxAngle: 30,
                      color: Colors.yellow,
                    ),
                    const RadialGaugeSegment(
                      widthAbsolute: 40.0,
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
      ],
    );
  }
}

class ArcPainter extends CustomPainter {
  ArcPainter({this.color = Colors.grey});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final rect2 = Rect.fromLTRB(24, 20, size.width - 25, size.height - 24);
    const startAngle = -3.14159;
    const sweepAngle = 3.14159;
    const useCenter = false;
    final paint1 = Paint()
      ..color = this.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40.0;
    final paint2 = Paint()
      ..color = const Color(0xFFC6C6C6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;
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
          ).createShader(rect));
    canvas.drawArc(rect2, startAngle, sweepAngle, useCenter, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
