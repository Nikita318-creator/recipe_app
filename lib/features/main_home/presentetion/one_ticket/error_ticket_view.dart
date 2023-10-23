import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_recipes/features/main_home/presentetion/bloc/digit_field_block_bloc.dart';

class ErrorTicketView extends StatelessWidget {
  const ErrorTicketView(
      {super.key, required this.errorNumber, required this.errorDescription});

  final String errorNumber;
  final String errorDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'response code: $errorNumber',
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 60,
          child: Text(errorDescription,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 22)),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Понятно, обновить'),
                  ],
                ),
              ),
              onPressed: () {
                context.read<DigitFieldBlockBloc>().add(OpenDigitField());
              },
            ),
          ),
        ),
      ],
    );
  }
}
