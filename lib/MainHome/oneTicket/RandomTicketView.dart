import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_recipes/MainHome/oneTicket/SliderForRandomTicketView.dart';
import 'package:name/theme/app_theme.dart';
import 'package:new_recipes/MainHome/bloc/digit_field_block_bloc.dart';

class RandomTicketView extends StatelessWidget {
  const RandomTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: SliderForRandomTicketView(
              title: "билет", count: 1, maxPossibleValue: 50),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: SliderForRandomTicketView(
              title: "число во второй части поля",
              count: 1,
              maxPossibleValue: 4),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: SliderForRandomTicketView(
              title: "множитель", count: 1, maxPossibleValue: 100),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: SliderForRandomTicketView(
              title: "тираж", count: 1, maxPossibleValue: 10),
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
                    Text('Оплатить 5 билетов'),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      color: AppTheme.of(context)
                          .colorScheme
                          .main
                          .primaryTextColor,
                      child: SizedBox(
                        height: 20,
                        width: 1,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '375 Р',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                context
                    .read<DigitFieldBlockBloc>()
                    .add(OpenRandomTicket(tappedDigit: 0, ticketId: 0));
                // Navigator.pop(context);
              },
            ),
          ),
        ))
      ],
    );
  }
}
