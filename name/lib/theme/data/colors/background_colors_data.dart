import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BackgroundColorsData extends Equatable {
  const BackgroundColorsData({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.surfaceVariant,
    required this.surface,
    required this.background,
  });

  factory BackgroundColorsData.light() => const BackgroundColorsData(
        primary: _primaryLight,
        secondary: _secondaryLight,
        tertiary: _tertiaryLight,
        surfaceVariant: _surfaceVariant,
        surface: _surface,
        background: _background,
      );

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color surfaceVariant;
  final Color surface;
  final Color background;

  static const Color _primaryLight = Color(0xFFFFFFFF);
  static const Color _secondaryLight = Color(0xFFFAFAFA);
  static const Color _tertiaryLight = Color(0xFFF3F4F6);
  static const Color _surfaceVariant = Color(0xFFEFF0F2);
  static const Color _surface = Color(0xFFFFFFFF);
  static const Color _background = Color(0xFFFAFBFF);

  @override
  List<Object?> get props => [
        primary,
        secondary,
        tertiary,
        surfaceVariant,
        surface,
      ];
}
