import 'package:flutter/material.dart';
import 'package:name/buttons/app_button_helpers.dart';
import 'package:name/buttons/app_button_type.dart';
import 'package:name/theme/app_theme.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.child,
    required this.type,
    required this.padding,
    required this.textColor,
    this.onPressed,
    this.width,
    this.height,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final AppButtonType type;
  final Color textColor;

  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        foregroundColor: AppButtonHelpers.foregroundColor(
          appTheme: appTheme,
          color: textColor,
        ),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (states) {
            switch (type) {
              case AppButtonType.floating:
                return Size(
                  width ?? double.infinity,
                  height ?? double.infinity,
                );
              case AppButtonType.fixedSmall:
                return Size.fromHeight(appTheme.spacing.sp48);
              case AppButtonType.fixedLarge:
                return Size.fromHeight(appTheme.spacing.sp48);
            }
          },
        ),
        iconSize: AppButtonHelpers.iconSize(appTheme: appTheme),
        textStyle:
            AppButtonHelpers.textStyle(color: textColor, appTheme: appTheme),
        fixedSize: AppButtonHelpers.fixedSize(
          appTheme: appTheme,
          type: type,
          width: width,
          height: height,
        ),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
