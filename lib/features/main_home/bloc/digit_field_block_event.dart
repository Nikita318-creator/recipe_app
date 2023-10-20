part of 'digit_field_block_bloc.dart';

sealed class DigitFieldBlockEvent extends Equatable {
  const DigitFieldBlockEvent();

  @override
  List<Object> get props => [];
}

final class OpenDigitField extends DigitFieldBlockEvent {}

final class OpenRandomTicket extends DigitFieldBlockEvent {}

final class AddDigit extends DigitFieldBlockEvent {

  const AddDigit({required this.tappedDigit});
  final int tappedDigit;

  @override
  List<Object> get props => [tappedDigit];
}

final class RemoveDigit extends DigitFieldBlockEvent {

  const RemoveDigit({required this.tappedDigit});
  final int tappedDigit;

  @override
  List<Object> get props => [tappedDigit];
}

final class MakePayment extends DigitFieldBlockEvent {}
