import 'package:flutter/material.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketPage.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketModel.dart';
import 'package:new_recipes/MainHome/bloc/digit_field_block_bloc.dart';

class ListViewMain extends StatefulWidget {
  ListViewMain({super.key, required this.state});

  final tickets = OneTicketModelsMoc.tickets;
  // final PageController controller = PageController();
  final DigitFieldBlockState state;

  @override
  State<ListViewMain> createState() => _ListViewMainState();

  int countOfTickets() {
    if (state is DigitFieldBlockMinCountTapped ||
        state is DigitFieldBlockMaxCountTapped ||
        state is DigitFieldBlockInitial) {
      return OneTicketModelsMoc.tickets.length;
    } else {
      return 1;
    }
  }
}

class _ListViewMainState extends State<ListViewMain> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              for (int index = 0; index < widget.countOfTickets(); index++)
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
                        child: OneTicketPage(
                            ticket: OneTicketModelsMoc.tickets[index],
                            state: widget.state),
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
