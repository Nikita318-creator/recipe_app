part of 'digit_field_block_bloc.dart';

sealed class DigitFieldBlockState extends Equatable {
  const DigitFieldBlockState();

  @override
  List<Object> get props => [];
}

final class DigitFieldBlockInitial extends DigitFieldBlockState {
  //  var tappedDigitsOnAllTickets = List.generate(
  //       OneTicketModelsMoc.tickets.length, (i) => List.filled(20, 0),
  //       growable: false);
  final List<int> tappedDigits = [];
  // final List<int> id;

  @override
  List<Object> get props => [tappedDigits];
}

final class DigitFieldBlockMinCountTapped extends DigitFieldBlockState {
  const DigitFieldBlockMinCountTapped({required this.tappedDigits});
  final List<int> tappedDigits;

  @override
  List<Object> get props => [tappedDigits];
}

final class DigitFieldBlockMaxCountTapped extends DigitFieldBlockState {
  const DigitFieldBlockMaxCountTapped({required this.tappedDigits});
  final List<int> tappedDigits;

  @override
  List<Object> get props => [tappedDigits];
}

final class RandomTicketChosen extends DigitFieldBlockState {
  const RandomTicketChosen({required this.tappedDigits});
  final List<int> tappedDigits;

  @override
  List<Object> get props => [];
}

final class DigitFieldBlockError extends DigitFieldBlockState {
  final String errorNumber;
  final String errorDescription;

  const DigitFieldBlockError(
      {required this.errorNumber, required this.errorDescription});

  @override
  List<Object> get props => [errorNumber];
}
