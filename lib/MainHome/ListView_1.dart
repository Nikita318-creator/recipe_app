import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketPage.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketModel.dart';

// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_recipes/MainHome/bloc/digit_field_block_bloc.dart';

class ListView_1 extends StatefulWidget {
  ListView_1({super.key});

  final tickets = OneTicketModelsMoc.tickets;
  // final PageController controller = PageController();

  @override
  State<ListView_1> createState() => _ListView_1State();
}

class _ListView_1State extends State<ListView_1> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => DigitFieldBlockBloc())],
        child: Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
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
        ));
  }
}
