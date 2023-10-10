part of 'digit_field_block_bloc.dart';

sealed class DigitFieldBlockEvent extends Equatable {
  const DigitFieldBlockEvent();

  @override
  List<Object> get props => [];
}

final class OpenDigitField extends DigitFieldBlockEvent {}

final class AddDigit extends DigitFieldBlockEvent {
  final int tappedTicket;

  const AddDigit({required this.tappedTicket});

  @override
  List<Object> get props => [tappedTicket];
}

final class RemoveDigit extends DigitFieldBlockEvent {
  final int tappedTicket;

  const RemoveDigit({required this.tappedTicket});

  @override
  List<Object> get props => [tappedTicket];
}
