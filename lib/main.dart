import 'package:flutter/material.dart';
import 'package:new_recipes/start_page.dart';
import "../start_page.dart";
import 'package:name/theme/app_theme.dart';
import 'package:name/theme/adaptive_theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      builder: (context, theme) => MaterialApp(
        color: AppTheme.of(context).colorScheme.background.primary,
        home: const StartPage(),
        theme: theme.materialTheme,
      ),
    );
  }
}
