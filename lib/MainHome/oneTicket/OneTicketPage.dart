import 'package:flutter/material.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketModel.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketView.dart';
import 'package:new_recipes/MainHome/oneTicket/RandomTicketView.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_recipes/MainHome/bloc/digit_field_block_bloc.dart';

class OneTicketPage extends StatefulWidget {
  const OneTicketPage({super.key, required this.ticket, required this.state});

  final OneTicketModel ticket;
  final DigitFieldBlockState state;

  @override
  State<OneTicketPage> createState() => OneTicketPageState();
}

class OneTicketPageState extends State<OneTicketPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.state is DigitFieldBlockInitial) {
      var state = widget.state as DigitFieldBlockInitial;
      return OneTicketView(
        ticket: widget.ticket,
        isNumberChosen: false,
        isMaxNumberChosen: false,
        tappedDigits: state.tappedDigits,
      );
    }
    if (widget.state is DigitFieldBlockMinCountTapped) {
      var state = widget.state as DigitFieldBlockMinCountTapped;
      return OneTicketView(
        ticket: widget.ticket,
        isNumberChosen: true,
        isMaxNumberChosen: false,
        tappedDigits: state.tappedDigits,
      );
    }
    if (widget.state is DigitFieldBlockMaxCountTapped) {
      var state = widget.state as DigitFieldBlockMaxCountTapped;
      return OneTicketView(
        ticket: widget.ticket,
        isNumberChosen: true,
        isMaxNumberChosen: true,
        tappedDigits: state.tappedDigits,
      );
    }
    if (widget.state is RandomTicketChosen) {
      return const RandomTicketView();
    } else {
      return const Text('Something went wrong');
    }
  }
}
