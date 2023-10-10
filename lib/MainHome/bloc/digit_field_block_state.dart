part of 'digit_field_block_bloc.dart';

sealed class DigitFieldBlockState extends Equatable {
  const DigitFieldBlockState();

  @override
  List<Object> get props => [];
}

final class DigitFieldBlockInitial extends DigitFieldBlockState {
  final List<int> tappedTickets = [];

  @override
  List<Object> get props => [tappedTickets];
}

final class DigitFieldBlockMinCountTapped extends DigitFieldBlockState {
  final List<int> tappedTickets;

  const DigitFieldBlockMinCountTapped({required this.tappedTickets});

  @override
  List<Object> get props => [tappedTickets];
}

final class DigitFieldBlockMaxCountTapped extends DigitFieldBlockState {
  final List<int> tappedTickets;

  const DigitFieldBlockMaxCountTapped({required this.tappedTickets});

  @override
  List<Object> get props => [tappedTickets];
}
