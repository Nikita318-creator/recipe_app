import 'package:flutter/material.dart';
import 'package:name/theme/data/colors/accent_colors_data.dart';
import 'package:name/theme/data/colors/background_colors_data.dart';
import 'package:name/theme/data/colors/error_colors_data.dart';
import 'package:name/theme/data/colors/neutral_colors_data.dart';
import 'package:name/theme/data/colors/success_colors_data.dart';

class AppColorScheme {
  const AppColorScheme({
    required this.accent,
    required this.background,
    required this.neutral,
    required this.error,
    required this.success,
    required this.textColor,
  });

  factory AppColorScheme.light() => AppColorScheme(
        accent: AccentColorsData.light(),
        background: BackgroundColorsData.light(),
        error: ErrorColorsData.light(),
        neutral: NeutralColorsData.light(),
        success: SuccessColorsData.light(),
        textColor: const Color(0xFF232F34),
      );

  factory AppColorScheme.dark() => AppColorScheme(
        accent: AccentColorsData.dark(),
        background: BackgroundColorsData.light(),
        error: ErrorColorsData.dark(),
        neutral: NeutralColorsData.light(),
        success: SuccessColorsData.light(),
        textColor: const Color(0xFF232F34),
      );

  final AccentColorsData accent;
  final BackgroundColorsData background;
  final NeutralColorsData neutral;
  final ErrorColorsData error;
  final SuccessColorsData success;
  final Color textColor;

  AppColorScheme copyWith({
    AccentColorsData? accent,
    BackgroundColorsData? background,
    NeutralColorsData? neutral,
    ErrorColorsData? error,
    SuccessColorsData? success,
    Color? textColor,
  }) =>
      AppColorScheme(
        accent: accent ?? this.accent,
        background: background ?? this.background,
        neutral: neutral ?? this.neutral,
        error: error ?? this.error,
        success: success ?? this.success,
        textColor: textColor ?? this.textColor,
      );
}
