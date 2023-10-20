import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ErrorColorsData extends Equatable {
  const ErrorColorsData({
    required this.primary,
  });

  factory ErrorColorsData.light() => const ErrorColorsData(
        primary: _primaryLight,
      );

  factory ErrorColorsData.dark() => const ErrorColorsData(
        primary: _primaryDark,
      );

  final Color primary;

  static const Color _primaryLight = Color(0xFFF66464);
  static const Color _primaryDark = Color.fromARGB(255, 101, 18, 18);

  @override
  List<Object?> get props => [
        primary,
      ];
}
