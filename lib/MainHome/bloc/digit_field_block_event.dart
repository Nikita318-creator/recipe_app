part of 'digit_field_block_bloc.dart';

sealed class DigitFieldBlockEvent extends Equatable {
  const DigitFieldBlockEvent();

  @override
  List<Object> get props => [];
}

final class OpenDigitField extends DigitFieldBlockEvent {}

final class OpenRandomTicket extends DigitFieldBlockEvent {
  final int tappedDigit;
  final int ticketId;

  const OpenRandomTicket({required this.tappedDigit, required this.ticketId});

  @override
  List<Object> get props => [tappedDigit];
}

final class AddDigit extends DigitFieldBlockEvent {
  final int tappedDigit;
  final int ticketId;

  const AddDigit({required this.tappedDigit, required this.ticketId});

  @override
  List<Object> get props => [tappedDigit];
}

final class RemoveDigit extends DigitFieldBlockEvent {
  final int tappedDigit;
  final int ticketId;

  const RemoveDigit({required this.tappedDigit, required this.ticketId});

  @override
  List<Object> get props => [tappedDigit];
}

final class MakePayment extends DigitFieldBlockEvent {}
