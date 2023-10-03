import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:name/theme/data/border_radius/app_border_radius.dart';
import 'package:name/theme/data/colors/app_color_scheme.dart';
import 'package:name/theme/data/icons/app_icons.dart';
import 'package:name/theme/data/material_theme/material_theme.dart';
import 'package:name/theme/data/shadows/app_shadows.dart';
import 'package:name/theme/data/spacing/app_spacing.dart';
import 'package:name/theme/data/typography/app_typography.dart';

export 'colors/app_color_scheme.dart';
export 'icons/app_icons.dart';
export 'shadows/app_shadows.dart';
export 'spacing/app_spacing.dart';
export 'typography/app_typography.dart';

class AppThemeData extends Equatable {
  const AppThemeData({
    required this.colorScheme,
    required this.typography,
    required this.spacing,
    required this.shadows,
    required this.icons,
    required this.radius,
    required this.materialTheme,
  });

  factory AppThemeData.light() => AppThemeData(
        colorScheme: AppColorScheme.light(),
        typography: AppTypography.regular(),
        spacing: AppSpacing.regular(),
        shadows: const AppShadows(),
        icons: AppIcons.regular(),
        radius: AppBorderRadius.regular(),
        materialTheme: MaterialTheme.lightTheme,
      );

  factory AppThemeData.dark() => AppThemeData(
        colorScheme: AppColorScheme.light(),
        typography: AppTypography.regular(),
        spacing: AppSpacing.regular(),
        shadows: const AppShadows(),
        icons: AppIcons.regular(),
        radius: AppBorderRadius.regular(),
        materialTheme: MaterialTheme.darkTheme,
      );

  final AppColorScheme colorScheme;
  final AppTypography typography;
  final AppSpacing spacing;
  final AppShadows shadows;
  final AppIcons icons;
  final AppBorderRadius radius;
  final ThemeData materialTheme;

  @override
  List<Object?> get props => [
        colorScheme,
        typography,
        spacing,
        shadows,
        icons,
        radius,
      ];
}
