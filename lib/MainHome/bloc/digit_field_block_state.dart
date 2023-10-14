part of 'digit_field_block_bloc.dart';

sealed class DigitFieldBlockState extends Equatable {
  const DigitFieldBlockState();

  @override
  List<Object> get props => [];
}

final class DigitFieldBlockInitial extends DigitFieldBlockState {
  final List<int> tappedDigits = [];

  @override
  List<Object> get props => [tappedDigits];
}

final class DigitFieldBlockMinCountTapped extends DigitFieldBlockState {
  final List<int> tappedDigits;

  const DigitFieldBlockMinCountTapped({required this.tappedDigits});

  @override
  List<Object> get props => [tappedDigits];
}

final class DigitFieldBlockMaxCountTapped extends DigitFieldBlockState {
  final List<int> tappedDigits;

  const DigitFieldBlockMaxCountTapped({required this.tappedDigits});

  @override
  List<Object> get props => [tappedDigits];
}

final class RandomTicketChosen extends DigitFieldBlockState {
  final List<int> tappedDigits;

  const RandomTicketChosen({required this.tappedDigits});

  @override
  List<Object> get props => [];
}

final class DigitFieldBlockError extends DigitFieldBlockState {}
