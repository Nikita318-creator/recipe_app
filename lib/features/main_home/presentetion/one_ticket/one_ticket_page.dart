import 'package:flutter/material.dart';
import 'package:new_recipes/features/main_home/bloc/digit_field_block_bloc.dart';
import 'package:new_recipes/features/main_home/models/one_ticket_model.dart';
import 'package:new_recipes/features/main_home/presentetion/one_ticket/one_ticket_view.dart';
import 'package:new_recipes/features/main_home/presentetion/one_ticket/random_ticket_view.dart';
import 'package:new_recipes/features/main_home/presentetion/one_ticket/error_ticket_view.dart';

class OneTicketPage extends StatefulWidget {
  const OneTicketPage({required this.ticket, required this.state, super.key});

  final OneTicketModel ticket;
  final DigitFieldBlockState state;

  @override
  State<OneTicketPage> createState() => OneTicketPageState();
}

class OneTicketPageState extends State<OneTicketPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.state is DigitFieldBlockInitial) {
      final state = widget.state as DigitFieldBlockInitial;
      return OneTicketView(
        ticket: widget.ticket,
        isNumberChosen: false,
        isMaxNumberChosen: false,
        tappedDigits: state.tappedDigits,
      );
    }
    if (widget.state is DigitFieldBlockMinCountTapped) {
      final state = widget.state as DigitFieldBlockMinCountTapped;
      return OneTicketView(
        ticket: widget.ticket,
        isNumberChosen: true,
        isMaxNumberChosen: false,
        tappedDigits: state.tappedDigits,
      );
    }
    if (widget.state is DigitFieldBlockMaxCountTapped) {
      final state = widget.state as DigitFieldBlockMaxCountTapped;
      return OneTicketView(
        ticket: widget.ticket,
        isNumberChosen: true,
        isMaxNumberChosen: true,
        tappedDigits: state.tappedDigits,
      );
    }
    if (widget.state is DigitFieldBlockError) {
      final state = widget.state as DigitFieldBlockError;

      return ErrorTicketView(
        errorNumber: state.errorNumber,
        errorDescription: state.errorDescription,
      );
    }
    if (widget.state is RandomTicketChosen) {
      return const RandomTicketView();
    } else {
      return const Text('Something went wrong');
    }
  }
}
