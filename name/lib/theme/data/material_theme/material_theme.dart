import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:name/theme/data/app_theme_data.dart';

class MaterialTheme {
  MaterialTheme._();

  static ThemeData get darkTheme => _materialTheme(
        colorScheme: AppColorScheme.dark(),
        typography: AppTypography.regular(),
        brightness: Brightness.dark,
      );

  static ThemeData get lightTheme => _materialTheme(
        colorScheme: AppColorScheme.light(),
        typography: AppTypography.regular(),
        brightness: Brightness.light,
      );

  static ThemeData _materialTheme({
    required AppColorScheme colorScheme,
    required AppTypography typography,
    required Brightness brightness,
  }) {
    final backgroundColor = colorScheme.background.background;

    final isBrightnessLight = brightness == Brightness.light;

    final buttonTheme = ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );

    return ThemeData(
      brightness: brightness,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        titleTextStyle: typography.headline4Bold
            .copyWith(color: colorScheme.neutral.primary),
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: backgroundColor,
          systemNavigationBarColor: backgroundColor,
          systemNavigationBarIconBrightness:
              isBrightnessLight ? Brightness.dark : Brightness.light,
          statusBarIconBrightness:
              isBrightnessLight ? Brightness.dark : Brightness.light,
          statusBarBrightness:
              isBrightnessLight ? Brightness.light : Brightness.dark,
        ),
        backgroundColor: backgroundColor,
        centerTitle: true,
        foregroundColor: backgroundColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: buttonTheme,

        // backgroundColor: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.contains(MaterialState.disabled)) {
        //       return appTheme.colorScheme.background.surfaceVariant;
        //     }

        //     return backgroundColor;
        //   },
        // ),
        // foregroundColor: AppButtonHelpers.foregroundColor(
        //   appTheme: appTheme,
        //   color: textColor,
        // ),
        // textStyle: AppButtonHelpers.textStyle(appTheme: appTheme),
        // fixedSize: AppButtonHelpers.fixedSize(
        //   appTheme: appTheme,
        //   type: type,
        //   width: width,
        //   height: height,
        // ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: buttonTheme,
      ),
      textButtonTheme: TextButtonThemeData(
        style: buttonTheme,
      ),
      sliderTheme: SliderThemeData(
        activeTickMarkColor: colorScheme.accent.primary,
        inactiveTickMarkColor: colorScheme.neutral.tertiaryVariant,
        activeTrackColor: colorScheme.accent.primary,
        inactiveTrackColor: colorScheme.neutral.tertiaryVariant,
      ),
    );
  }
}
