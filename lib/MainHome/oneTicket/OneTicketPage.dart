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
        tappedDigits: state.tappedDigits[int.parse(widget.ticket.id)] ?? [],
      );
    }
    if (widget.state is DigitFieldBlockMinCountTapped) {
      var state = widget.state as DigitFieldBlockMinCountTapped;
      return OneTicketView(
        ticket: widget.ticket,
        isNumberChosen: true,
        isMaxNumberChosen: false,
        tappedDigits: state.tappedDigits[int.parse(widget.ticket.id)] ?? [],
      );
    }
    if (widget.state is DigitFieldBlockMaxCountTapped) {
      var state = widget.state as DigitFieldBlockMaxCountTapped;
      return OneTicketView(
        ticket: widget.ticket,
        isNumberChosen: true,
        isMaxNumberChosen: true,
        tappedDigits: state.tappedDigits[int.parse(widget.ticket.id)] ?? [],
      );
    }
    if (widget.state is RandomTicketChosen) {
      return const RandomTicketView();
    }
    if (widget.state is DigitFieldBlockError) {
      var state = widget.state as DigitFieldBlockError;
      return SizedBox(
        width: MediaQuery.of(context).size.width - 25,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(state.numberError),
                  content: Text(state.errorDescription),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              child: const Text('reload'),
            ),
          ],
        ),
      );
    } else {
      return const Text('Something went wrong');
    }
  }
}
