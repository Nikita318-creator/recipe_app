import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketModel.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketView.dart';
// import 'package:new_recipes/MainHome/oneTicket/DigitField.dart';
// import 'package:name/theme/app_theme.dart';

// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_recipes/MainHome/bloc/digit_field_block_bloc.dart';

class OneTicketPage extends StatefulWidget {
  OneTicketPage({super.key, required this.ticket});

  OneTicketModel ticket;

  @override
  State<OneTicketPage> createState() => OneTicketPageState();
}

class OneTicketPageState extends State<OneTicketPage> {
  bool _isNumberChosen = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DigitFieldBlockBloc, DigitFieldBlockState>(
        builder: (context, state) {
      if (state is DigitFieldBlockInitial) {
        return OneTicketView(
          ticket: widget.ticket,
          isNumberChosen: false,
          isMaxNumberChosen: false,
          tappedDigits: state.tappedDigits,
        );
      }
      if (state is DigitFieldBlockMinCountTapped) {
        return OneTicketView(
          ticket: widget.ticket,
          isNumberChosen: true,
          isMaxNumberChosen: false,
          tappedDigits: state.tappedDigits,
        );
      }
      if (state is DigitFieldBlockMaxCountTapped) {
        return OneTicketView(
          ticket: widget.ticket,
          isNumberChosen: true,
          isMaxNumberChosen: true,
          tappedDigits: state.tappedDigits,
        );
      } else {
        return const Text('Something went wrong');
      }
    });
  }
}
