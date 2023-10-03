import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:name/theme/data/typography/app_text_styles.dart';

class AppTypography extends Equatable {
  const AppTypography({
    required this.headline1Bold,
    required this.headline3Bold,
    required this.headline4Bold,
    required this.headline5Bold,
    required this.headline5Regular,
    required this.headline6Bold,
    required this.headline6Regular,
    required this.body15Bold,
    required this.body15Regular,
    required this.subhead14Bold,
    required this.subhead14Regular,
    required this.caption12Bold,
    required this.caption12Regular,
  });

  factory AppTypography.regular() => const AppTypography(
        body15Bold: AppTextStyles.body15Bold,
        body15Regular: AppTextStyles.body15Regular,
        caption12Bold: AppTextStyles.caption12Bold,
        caption12Regular: AppTextStyles.caption12Regular,
        headline1Bold: AppTextStyles.headline1Bold,
        headline3Bold: AppTextStyles.headline3Bold,
        headline4Bold: AppTextStyles.headline4Bold,
        headline5Bold: AppTextStyles.headline5Bold,
        headline5Regular: AppTextStyles.headline5Regular,
        headline6Bold: AppTextStyles.headline6Bold,
        headline6Regular: AppTextStyles.headline6Regular,
        subhead14Bold: AppTextStyles.subhead14Bold,
        subhead14Regular: AppTextStyles.subhead14Regular,
      );

  final TextStyle headline1Bold;
  final TextStyle headline3Bold;
  final TextStyle headline4Bold;
  final TextStyle headline5Bold;
  final TextStyle headline5Regular;
  final TextStyle headline6Bold;
  final TextStyle headline6Regular;
  final TextStyle body15Bold;
  final TextStyle body15Regular;
  final TextStyle subhead14Bold;
  final TextStyle subhead14Regular;
  final TextStyle caption12Bold;
  final TextStyle caption12Regular;

  @override
  List<Object?> get props => [
        headline1Bold,
        headline3Bold,
        headline4Bold,
        headline5Bold,
        headline5Regular,
        headline6Bold,
        headline6Regular,
        body15Bold,
        body15Regular,
        subhead14Bold,
        subhead14Regular,
        caption12Bold,
        caption12Regular,
      ];

  AppTypography withColor(Color? color) => AppTypography(
        body15Bold: AppTextStyles.body15Bold.apply(color: color),
        body15Regular: AppTextStyles.body15Regular.apply(color: color),
        caption12Bold: AppTextStyles.caption12Bold.apply(color: color),
        caption12Regular: AppTextStyles.caption12Regular.apply(color: color),
        headline1Bold: AppTextStyles.headline1Bold.apply(color: color),
        headline3Bold: AppTextStyles.headline3Bold.apply(color: color),
        headline4Bold: AppTextStyles.headline4Bold.apply(color: color),
        headline5Bold: AppTextStyles.headline5Bold.apply(color: color),
        headline5Regular: AppTextStyles.headline5Regular.apply(color: color),
        headline6Bold: AppTextStyles.headline6Bold.apply(color: color),
        headline6Regular: AppTextStyles.headline6Regular.apply(color: color),
        subhead14Bold: AppTextStyles.subhead14Bold.apply(color: color),
        subhead14Regular: AppTextStyles.subhead14Regular.apply(color: color),
      );
}
