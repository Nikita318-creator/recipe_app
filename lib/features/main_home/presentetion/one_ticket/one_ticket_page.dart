import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_recipes/features/main_home/data/models/one_ticket_model.dart';
import 'package:new_recipes/features/main_home/presentetion/bloc/digit_field_block_bloc.dart';
import 'package:new_recipes/features/main_home/presentetion/one_ticket/error_ticket_view.dart';
import 'package:new_recipes/features/main_home/presentetion/one_ticket/one_ticket_view.dart';
import 'package:new_recipes/features/main_home/presentetion/one_ticket/random_ticket_view.dart';

class OneTicketPage extends StatelessWidget {
  const OneTicketPage({required this.ticket, super.key});

  final OneTicketModel ticket;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DigitFieldBlockBloc, DigitFieldBlockState>(
        builder: (context, state) {
      return Row(
        children: [
          ...switch (state) {
            DigitFieldBlockInitial() => [
                OneTicketView(
                  ticket: ticket,
                  isNumberChosen: false,
                  isMaxNumberChosen: false,
                  tappedDigits: state.tappedDigits,
                )
              ],
            DigitFieldBlockMinCountTapped() => [
                OneTicketView(
                  ticket: ticket,
                  isNumberChosen: true,
                  isMaxNumberChosen: false,
                  tappedDigits: state.tappedDigits,
                )
              ],
            DigitFieldBlockMaxCountTapped() => [
                OneTicketView(
                  ticket: ticket,
                  isNumberChosen: true,
                  isMaxNumberChosen: true,
                  tappedDigits: state.tappedDigits,
                )
              ],
            DigitFieldBlockError() => [
                ErrorTicketView(
                  errorNumber: state.errorNumber,
                  errorDescription: state.errorDescription,
                )
              ],
            LoadingState() => [
                CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black))
              ],
            RandomTicketChosen() => [RandomTicketView()],
          }
        ],
      );
    });
  }
}
