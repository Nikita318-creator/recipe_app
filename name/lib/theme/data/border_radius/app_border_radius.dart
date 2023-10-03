import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppBorderRadius extends Equatable {
  const AppBorderRadius({
    required this.radius8,
    required this.radius30,
    required this.radiusTop8,
  });

  factory AppBorderRadius.regular() => const AppBorderRadius(
        radius8: BorderRadius.all(
          Radius.circular(8),
        ),
        radius30: BorderRadius.all(
          Radius.circular(30),
        ),
        radiusTop8: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      );

  final BorderRadius radius8;
  final BorderRadius radiusTop8;
  final BorderRadius radius30;

  @override
  List<Object?> get props => [
        radius8,
      ];
}
