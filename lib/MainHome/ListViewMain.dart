import 'package:flutter/material.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketPage.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketModel.dart';

class ListViewMain extends StatefulWidget {
  ListViewMain({super.key});

  final tickets = OneTicketModelsMoc.tickets;
  // final PageController controller = PageController();

  @override
  State<ListViewMain> createState() => _ListViewMainState();
}

class _ListViewMainState extends State<ListViewMain> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              for (var ticket in OneTicketModelsMoc.tickets)
                Row(
                  children: [
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: OneTicketPage(ticket: ticket),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
