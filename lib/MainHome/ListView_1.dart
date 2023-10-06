import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketPage.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketModel.dart';

class ListView_1 extends StatefulWidget {
  ListView_1({super.key});

  final tickets = OneTicketModelsMoc.tickets;
  final PageController controller = PageController();

  @override
  State<ListView_1> createState() => _ListView_1State();
}

class _ListView_1State extends State<ListView_1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              for (var ticket in OneTicketModelsMoc.tickets)
                OneTicketPage(ticket: ticket),
            ],
          ),
        )
      ],
    );

    // return PageView(
    //   // scrollDirection: Axis.horizontal, // horizontal by default
    //   children: [
    //     for (var ticket in OneTicketModelsMoc.tickets)
    //       Column(
    //         children: [
    //           Row(
    //             children: [
    //               OneTicketPage(ticket: ticket),
    //             ],
    //           ),
    //         ],
    //       ),
    //   ],
    // );
  }
}
