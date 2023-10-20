import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppShadows extends Equatable {
  const AppShadows();

  List<BoxShadow> get elevation16 => [_shadow6, _shadow8];
  List<BoxShadow> get elevation32 => [_shadow8, _shadow16];

  static const BoxShadow _shadow6 =
      BoxShadow(blurRadius: 14, color: Color.fromRGBO(0, 0, 0, 0.06));

  static const BoxShadow _shadow8 = BoxShadow(
    blurRadius: 2,
    color: Color.fromRGBO(0, 0, 0, 0.08),
  );

  static const BoxShadow _shadow16 = BoxShadow(
    blurRadius: 24,
    color: Color.fromRGBO(0, 0, 0, 0.16),
  );

  @override
  List<Object?> get props => [
        _shadow8,
        _shadow6,
        _shadow16,
      ];
}
