import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MainColorsData extends Equatable {
  const MainColorsData({
    required this.backgroundMain,
    required this.backgroundTop,
  });

  factory MainColorsData.light() => const MainColorsData(
        backgroundMain: _backgroundMain,
        backgroundTop: _backgroundTop,
      );

  final Color backgroundMain;
  final Color backgroundTop;

  static const Color _backgroundMain = Color.fromARGB(255, 62, 67, 83);
  static const Color _backgroundTop = Color(0xff2e3650);

  @override
  List<Object?> get props => [
        backgroundMain,
        backgroundTop,
      ];
}
