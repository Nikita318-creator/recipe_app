import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyPainter extends StatefulWidget {
  const MyPainter({super.key});

  @override
  _MyPainterState createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter> {
  var _sides = 3.0;
  var _radius = 100.0;
  var _radians = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polygons'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: CustomPaint(
                painter: ShapePainter(_sides, _radius, _radians),
                child: Container(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Sides'),
            ),
            Slider(
              value: _sides,
              min: 3,
              max: 10,
              label: _sides.toInt().toString(),
              divisions: 7,
              onChanged: (value) {
                setState(() {
                  _sides = value;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Size'),
            ),
            Slider(
              value: _radius,
              min: 10,
              max: MediaQuery.of(context).size.width / 2,
              onChanged: (value) {
                setState(() {
                  _radius = value;
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Rotation'),
            ),
            Slider(
              value: _radians,
              max: math.pi,
              onChanged: (value) {
                setState(() {
                  _radians = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// FOR PAINTING POLYGONS
class ShapePainter extends CustomPainter {
  ShapePainter(this.sides, this.radius, this.radians);
  final double sides;
  final double radius;
  final double radians;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final path = Path();

    final angle = (math.pi * 2) / sides;

    final center = Offset(size.width / 2, size.height / 2);
    final startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (var i = 1; i <= sides; i++) {
      final x = radius * math.cos(radians + angle * i) + center.dx;
      final y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
