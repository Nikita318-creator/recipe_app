part of 'digit_field_block_bloc.dart';

sealed class DigitFieldBlockState extends Equatable {
  const DigitFieldBlockState();

  @override
  List<Object> get props => [];
}

final class DigitFieldBlockInitial extends DigitFieldBlockState {
  final Map<int, List<int>> tappedDigits = {};

  @override
  List<Object> get props => [tappedDigits];
}

final class DigitFieldBlockMinCountTapped extends DigitFieldBlockState {
  final Map<int, List<int>> tappedDigits;

  const DigitFieldBlockMinCountTapped({required this.tappedDigits});

  factory DigitFieldBlockMinCountTapped.map(List<int> digits, int id) {
    return DigitFieldBlockMinCountTapped(tappedDigits: {id: digits});
  }

  @override
  List<Object> get props => [tappedDigits];
}

final class DigitFieldBlockMaxCountTapped extends DigitFieldBlockState {
  final Map<int, List<int>> tappedDigits;

  const DigitFieldBlockMaxCountTapped({required this.tappedDigits});

  factory DigitFieldBlockMaxCountTapped.map(List<int> digits, int id) {
    return DigitFieldBlockMaxCountTapped(tappedDigits: {id: digits});
  }

  @override
  List<Object> get props => [tappedDigits];
}

final class RandomTicketChosen extends DigitFieldBlockState {
  final Map<int, List<int>> tappedDigits;

  const RandomTicketChosen({required this.tappedDigits});

  factory RandomTicketChosen.map(List<int> digits, int id) {
    return RandomTicketChosen(tappedDigits: {id: digits});
  }

  @override
  List<Object> get props => [tappedDigits];
}

final class DigitFieldBlockError extends DigitFieldBlockState {
  final String numberError;
  final String errorDescription;

  const DigitFieldBlockError(
      {required this.numberError, required this.errorDescription});

  @override
  List<Object> get props => [numberError];
}
