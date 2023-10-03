import 'package:equatable/equatable.dart';

class AppIconsSizes extends Equatable {
  const AppIconsSizes({
    required this.size36,
    required this.size28,
    required this.size24,
    required this.size18,
    required this.size16,
  });

  factory AppIconsSizes.regular() => const AppIconsSizes(
        size36: 36,
        size28: 28,
        size24: 24,
        size18: 18,
        size16: 16,
      );

  final double size36;
  final double size28;
  final double size24;
  final double size18;
  final double size16;

  @override
  List<Object?> get props => [
        size36,
        size28,
        size24,
        size18,
        size16,
      ];
}
