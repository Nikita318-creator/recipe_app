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

  static const Color _backgroundMain = Color.fromARGB(255, 255, 255, 255);
  static const Color _backgroundTop = Color.fromARGB(255, 255, 255, 255);

  @override
  List<Object?> get props => [
        backgroundMain,
        backgroundTop,
      ];
}
