import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_recipes/features/main_home/presentetion/one_ticket/slider_for_random_ticket_view.dart';
import 'package:name/theme/app_theme.dart';
import 'package:new_recipes/features/main_home/bloc/digit_field_block_bloc.dart';

class ErrorTicketView extends StatelessWidget {
  const ErrorTicketView(
      {super.key, required this.errorNumber, required this.errorDescription});

  final String errorNumber;
  final String errorDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Text(errorNumber),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Text(errorDescription),
        ),
        Container(
            child: SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width - 80,
          child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black87)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Оплатить 5 билетов'),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      color: AppTheme.of(context)
                          .colorScheme
                          .main
                          .primaryTextColor,
                      child: const SizedBox(
                        height: 20,
                        width: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      '375 Р',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                context.read<DigitFieldBlockBloc>().add(MakePayment());
                // context.read<DigitFieldBlockBloc>().add(OpenRandomTicket());
                // Navigator.pop(context);
              },
            ),
          ),
        ))
      ],
    );
  }
}
