import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AccentColorsData extends Equatable {
  const AccentColorsData({
    required this.primary,
    required this.secondary,
  });

  factory AccentColorsData.light() => const AccentColorsData(
        primary: _primaryLight,
        secondary: _secondaryLight,
      );

  factory AccentColorsData.dark() => const AccentColorsData(
        primary: _primaryDark,
        secondary: _secondaryDark,
      );

  final Color primary;
  final Color secondary;

  static const Color _primaryLight = Color(0xFF5AABEC);
  static const Color _secondaryLight = Color.fromRGBO(90, 171, 236, 0.08);

  static const Color _primaryDark = Color.fromARGB(255, 15, 80, 133);
  static const Color _secondaryDark = Color.fromRGBO(21, 50, 73, 0.078);

  @override
  List<Object?> get props => [
        primary,
        secondary,
      ];
}
