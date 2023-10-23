import 'package:flutter/material.dart';
import 'package:new_recipes/features/main_home/presentetion/one_ticket/one_ticket_page.dart';
import 'package:new_recipes/features/main_home/data/models/one_ticket_model.dart';

class ListViewMain extends StatelessWidget {
  ListViewMain({super.key});

  final tickets = OneTicketModelsMoc.tickets;
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        children: [
          for (int index = 0;
              index < OneTicketModelsMoc.tickets.length;
              index++)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    child: OneTicketPage(
                        ticket: OneTicketModelsMoc.tickets[index]),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
