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

// MARK: - second exampel of pointer

// class MyPainter extends StatefulWidget {
//   @override
//   _MyPainterState createState() => _MyPainterState();
// }

// class _MyPainterState extends State<MyPainter>
//     with SingleTickerProviderStateMixin {
//   var _radius = 100.0;

//   late Animation<double> animation;
//   late AnimationController controller;

//   @override
//   void initState() {
//     super.initState();

//     controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 8),
//     );

//     Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);

//     animation = _rotationTween.animate(controller)
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           controller.repeat();
//         } else if (status == AnimationStatus.dismissed) {
//           controller.forward();
//         }
//       });

//     controller.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Visualizer'),
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Expanded(
//               child: CustomPaint(
//                 foregroundPainter: PointPainter(_radius, animation.value),
//                 painter: CirclePainter(_radius),
//                 child: Container(),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 16.0),
//               child: Text('Size'),
//             ),
//             Slider(
//               value: _radius,
//               min: 10.0,
//               max: MediaQuery.of(context).size.width / 2,
//               onChanged: (value) {
//                 setState(() {
//                   _radius = value;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // FOR PAINTING THE CIRCLE
// class CirclePainter extends CustomPainter {
//   final double radius;
//   CirclePainter(this.radius);

//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = Colors.purpleAccent
//       ..strokeWidth = 3
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     var path = Path();
//     path.addOval(Rect.fromCircle(
//       center: Offset(size.width / 2, size.height / 2),
//       radius: radius,
//     ));
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

// // FOR PAINTING THE TRACKING POINT
// class PointPainter extends CustomPainter {
//   final double radius;
//   final double radians;
//   PointPainter(this.radius, this.radians);

//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = Colors.teal
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     var pointPaint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 1
//       ..style = PaintingStyle.fill
//       ..strokeCap = StrokeCap.round;

//     var innerCirclePaint = Paint()
//       ..color = Colors.red
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     final textSpan = TextSpan(
//       text:
//           "(${(radius * math.cos(radians)).round()}, ${(radius * math.sin(radians)).round()})",
//       style: TextStyle(color: Colors.black, fontSize: 16),
//     );
//     final textPainter = TextPainter(
//       text: textSpan,
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout(
//       minWidth: 0,
//       maxWidth: 100,
//     );

//     var path = Path();

//     Offset center = Offset(size.width / 2, size.height / 2);

//     path.moveTo(center.dx, center.dy);

//     Offset pointOnCircle = Offset(
//       radius * math.cos(radians) + center.dx,
//       radius * math.sin(radians) + center.dy,
//     );

//     // For showing the point moving on the circle
//     canvas.drawCircle(pointOnCircle, 10, pointPaint);

//     // For drawing the inner circle
//     if (math.cos(radians) < 0.0) {
//       canvas.drawCircle(center, -radius * math.cos(radians), innerCirclePaint);
//       textPainter.paint(
//         canvas,
//         pointOnCircle + Offset(-radius * 0.7, 10),
//       );
//     } else {
//       canvas.drawCircle(center, radius * math.cos(radians), innerCirclePaint);
//       textPainter.paint(
//         canvas,
//         pointOnCircle + Offset(10, 10),
//       );
//     }

//     path.lineTo(pointOnCircle.dx, pointOnCircle.dy);
//     path.lineTo(pointOnCircle.dx, center.dy);

//     path.close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
