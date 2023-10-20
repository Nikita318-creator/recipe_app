import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NeutralColorsData extends Equatable {
  const NeutralColorsData({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.tertiaryVariant,
  });

  factory NeutralColorsData.light() => const NeutralColorsData(
        primary: _primaryLight,
        secondary: _secondaryLight,
        tertiary: _tertiaryLight,
        tertiaryVariant: _tertiaryVariantLight,
      );

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color tertiaryVariant;

  static const Color _primaryLight = Color(0xFF0D2858);
  static const Color _secondaryLight = Color(0xFF424242);
  static const Color _tertiaryLight = Color(0xFFBDBEBF);
  static const Color _tertiaryVariantLight = Color(0xFFE3E4E5);

  @override
  List<Object?> get props => [
        primary,
        secondary,
        tertiary,
        tertiaryVariant,
      ];
}
