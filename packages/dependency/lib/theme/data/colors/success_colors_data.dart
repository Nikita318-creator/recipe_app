import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SuccessColorsData extends Equatable {
  const SuccessColorsData({
    required this.primary,
  });

  factory SuccessColorsData.light() => const SuccessColorsData(
        primary: _primaryLight,
      );

  final Color primary;

  static const Color _primaryLight = Color(0xFF27AE60);

  @override
  List<Object?> get props => [
        primary,
      ];
}
