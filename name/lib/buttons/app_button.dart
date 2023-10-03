import 'package:flutter/material.dart';
import 'package:name/buttons/app_button_style.dart';
import 'package:name/buttons/app_button_type.dart';
import 'package:name/buttons/app_elevated_button.dart';
import 'package:name/buttons/app_outline_button.dart';
import 'package:name/buttons/app_text_button.dart';
import 'package:name/theme/app_theme.dart';

export 'app_button_style.dart';
export 'app_button_type.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.type,
    required this.style,
    required this.center,
    this.onPressed,
    this.left,
    this.right,
    this.height,
    this.width,
    super.key,
  });

  const AppButton.primary({
    required this.type,
    required this.center,
    this.onPressed,
    this.left,
    this.right,
    this.height,
    this.width,
    this.style = const PrimaryAppButtonStyle(),
    super.key,
  });

  const AppButton.secondary({
    required this.type,
    required this.center,
    this.onPressed,
    this.left,
    this.right,
    this.height,
    this.width,
    this.style = const SecondaryAppButtonStyle(),
    super.key,
  });

  const AppButton.outline({
    required this.type,
    required this.center,
    this.onPressed,
    this.left,
    this.right,
    this.height,
    this.width,
    this.style = const OutlineAppButtonStyle(),
    super.key,
  });

  const AppButton.uncolored({
    required this.type,
    required this.center,
    this.onPressed,
    this.left,
    this.right,
    this.height,
    this.width,
    this.style = const UncoloredAppButtonStyle(),
    super.key,
  });

  const AppButton.warning({
    required this.type,
    required this.center,
    this.onPressed,
    this.left,
    this.right,
    this.height,
    this.width,
    this.style = const WarningAppButtonStyle(),
    super.key,
  });

  final VoidCallback? onPressed;
  final AppButtonType type;
  final AppButtonStyle style;
  final Widget center;
  final Widget? left;
  final Widget? right;
  final double? height;
  final double? width;

  static const defaultButtonPadding =
      EdgeInsets.symmetric(horizontal: 24, vertical: 8);

  static const textButtonPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    final colorScheme = appTheme.colorScheme;
    final accentPrimaryColor = colorScheme.accent.primary;

    final Widget child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (left != null)
          Padding(
            padding: EdgeInsets.only(right: appTheme.spacing.sp4),
            child: left,
          ),
        center,
        if (right != null)
          Padding(
            padding: EdgeInsets.only(left: appTheme.spacing.sp4),
            child: right,
          ),
      ],
    );

    return switch (style) {
      final PrimaryAppButtonStyle _ => AppElevatedButton(
          height: height,
          width: width,
          type: type,
          onPressed: onPressed,
          textColor: colorScheme.background.primary,
          backgroundColor: accentPrimaryColor,
          padding: defaultButtonPadding,
          child: child,
        ),
      final SecondaryAppButtonStyle _ => AppElevatedButton(
          height: height,
          width: width,
          type: type,
          onPressed: onPressed,
          backgroundColor: colorScheme.background.surfaceVariant,
          textColor: colorScheme.neutral.primary,
          padding: defaultButtonPadding,
          child: child,
        ),
      final OutlineAppButtonStyle _ => AppOutlineButton(
          height: height,
          width: width,
          type: type,
          onPressed: onPressed,
          backgroundColor: accentPrimaryColor,
          textColor: colorScheme.neutral.primary,
          padding: defaultButtonPadding,
          child: child,
        ),
      final UncoloredAppButtonStyle _ => AppTextButton(
          height: height,
          width: width,
          type: type,
          onPressed: onPressed,
          textColor: accentPrimaryColor,
          padding: textButtonPadding,
          child: child,
        ),
      final WarningAppButtonStyle _ => AppElevatedButton(
          height: height,
          width: width,
          type: type,
          onPressed: onPressed,
          backgroundColor: colorScheme.error.primary,
          textColor: colorScheme.background.surface,
          padding: defaultButtonPadding,
          child: child,
        ),
    };
  }
}
