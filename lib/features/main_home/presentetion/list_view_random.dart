import 'package:flutter/material.dart';
import 'package:new_recipes/features/main_home/data/models/one_ticket_model.dart';
import 'package:new_recipes/features/main_home/presentetion/one_ticket/one_ticket_page.dart';

class ListViewRandom extends StatelessWidget {
  ListViewRandom({super.key});

  final tickets = OneTicketModelsMoc.tickets;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child:
                          OneTicketPage(ticket: OneTicketModelsMoc.tickets[0]),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
