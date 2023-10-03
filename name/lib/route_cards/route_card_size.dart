import 'package:flutter/material.dart';

enum RouteCardSize {
  small(width: 306, imageSize: Size(306, 108)),
  large(width: 343, imageSize: Size(343, 162));

  const RouteCardSize({required this.width, required this.imageSize});

  final double width;
  final Size imageSize;

  Size get size => Size.fromWidth(width);
}
