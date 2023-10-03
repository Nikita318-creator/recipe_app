import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:name/name.dart';

typedef AdaptiveThemeBuilder = Widget Function(
  BuildContext context,
  AppThemeData theme,
);

class AdaptiveTheme extends StatefulWidget {
  const AdaptiveTheme({
    required this.builder,
    Key? key,
  }) : super(key: key);
  final AdaptiveThemeBuilder builder;

  @override
  State<AdaptiveTheme> createState() => _AdaptiveThemeState();

  static AppThemeColorMode colorModeOf(BuildContext context) {
    final platformBrightness =
        View.of(context).platformDispatcher.platformBrightness;
    final useDarkTheme = platformBrightness == ui.Brightness.dark;
    if (useDarkTheme) {
      return AppThemeColorMode.dark;
    }

    return AppThemeColorMode.light;
  }
}

class _AdaptiveThemeState extends State<AdaptiveTheme> {
  var theme = AppThemeData.light();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    View.of(context).platformDispatcher.onPlatformBrightnessChanged = () {
      final colorMode = AdaptiveTheme.colorModeOf(context);
      switch (colorMode) {
        case AppThemeColorMode.dark:
          setState(() => theme = AppThemeData.dark());
          break;
        case AppThemeColorMode.light:
          setState(() => theme = AppThemeData.light());
          break;
      }
    };
  }

  @override
  void initState() {
    super.initState();

    unawaited(
      SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[
          DeviceOrientation.portraitUp,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      theme: theme,
      child: widget.builder(context, theme),
    );
  }
}

enum AppThemeColorMode {
  light,
  dark,
}
