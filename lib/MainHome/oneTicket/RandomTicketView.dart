import 'package:flutter/material.dart';
import 'package:new_recipes/MainHome/oneTicket/SliderForRandomTicketView.dart';
import 'package:name/theme/app_theme.dart';

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
        // SizedBox(
        //   width: MediaQuery.of(context).size.width - 40,
        //   child: const SliderForRandomTicketView(title: "тираж", count: 1, maxPossibleValue: 10),
        // ),
      ],
    );
  }
}
