import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MainColorsData extends Equatable {
  const MainColorsData({
    required this.backgroundMain,
    required this.backgroundTop,
    required this.accentColor,
    required this.primaryTextColor,
  });

  factory MainColorsData.light() => const MainColorsData(
        backgroundMain: _backgroundMain,
        backgroundTop: _backgroundTop,
        accentColor: _accentColor,
        primaryTextColor: _primaryTextColor,
      );

  final Color backgroundMain;
  final Color backgroundTop;
  final Color accentColor;
  final Color primaryTextColor;

  static const Color _backgroundMain = Color.fromARGB(255, 62, 67, 83);
  static const Color _backgroundTop = Color(0xff2e3650);
  static const Color _accentColor = Colors.amber;
  static const Color _primaryTextColor = Colors.grey;

  @override
  List<Object?> get props => [
        backgroundMain,
        backgroundTop,
        accentColor,
        primaryTextColor,
      ];
}
