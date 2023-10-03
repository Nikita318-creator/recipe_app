import 'package:flutter/material.dart';
import 'package:name/buttons/app_button_type.dart';
import 'package:name/theme/data/app_theme_data.dart';

abstract class AppButtonHelpers {
  AppButtonHelpers._();

  static MaterialStateProperty<Color> foregroundColor({
    required AppThemeData appTheme,
    required Color color,
  }) =>
      MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return appTheme.colorScheme.neutral.tertiary;
          }

          return color;
        },
      );

  static MaterialStateProperty<TextStyle> textStyle({
    required AppThemeData appTheme,
    Color? color,
  }) =>
      MaterialStateProperty.resolveWith<TextStyle>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return appTheme.typography.headline6Bold
                .copyWith(color: appTheme.colorScheme.neutral.tertiary);
          }

          return appTheme.typography.headline6Bold.copyWith(color: color);
        },
      );

  static MaterialStateProperty<double> iconSize({
    required AppThemeData appTheme,
  }) =>
      MaterialStateProperty.all<double>(appTheme.icons.sizes.size18);

  static MaterialStateProperty<Size> fixedSize({
    required AppThemeData appTheme,
    required AppButtonType type,
    double? width,
    double? height,
  }) =>
      MaterialStateProperty.resolveWith<Size>(
        (states) {
          switch (type) {
            case AppButtonType.floating:
              return Size(
                width ?? double.infinity,
                height ?? double.infinity,
              );
            case AppButtonType.fixedSmall:
              return Size.fromHeight(appTheme.spacing.sp36);
            case AppButtonType.fixedLarge:
              return Size.fromHeight(appTheme.spacing.sp48);
          }
        },
      );
}
