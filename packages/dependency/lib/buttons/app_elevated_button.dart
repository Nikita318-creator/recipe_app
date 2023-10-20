import 'package:flutter/material.dart';
import 'package:name/buttons/app_button_helpers.dart';
import 'package:name/buttons/app_button_type.dart';
import 'package:name/theme/app_theme.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    required this.child,
    required this.type,
    required this.padding,
    required this.backgroundColor,
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
  final Color backgroundColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        iconSize: AppButtonHelpers.iconSize(appTheme: appTheme),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return appTheme.colorScheme.background.surfaceVariant;
            }

            return backgroundColor;
          },
        ),
        foregroundColor: AppButtonHelpers.foregroundColor(
          appTheme: appTheme,
          color: textColor,
        ),
        textStyle: AppButtonHelpers.textStyle(appTheme: appTheme),
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
