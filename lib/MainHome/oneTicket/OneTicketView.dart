import 'package:flutter/material.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketModel.dart';
import 'package:new_recipes/MainHome/oneTicket/DigitField.dart';
import 'package:name/theme/app_theme.dart';

// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:new_recipes/MainHome/bloc/digit_field_block_bloc.dart';

class OneTicketView extends StatefulWidget {
  const OneTicketView(
      {super.key,
      required this.ticket,
      required this.isNumberChosen,
      required this.isMaxNumberChosen,
      required this.tappedDigits});

  final OneTicketModel ticket;
  final bool isNumberChosen;
  final bool isMaxNumberChosen;
  final List<int> tappedDigits;

  @override
  State<OneTicketView> createState() => OneTicketViewState();
}

class OneTicketViewState extends State<OneTicketView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: [
              SizedBox(width: 15),
              Text(
                'Билет ${widget.ticket.id}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    color:
                        AppTheme.of(context).colorScheme.main.primaryTextColor,
                    onPressed: () {},
                    icon: const Icon(Icons.brush_outlined),
                  ),
                  IconButton(
                    color:
                        AppTheme.of(context).colorScheme.main.primaryTextColor,
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: [
              SizedBox(width: 15),
              Text(
                'Первая часть поля',
                style: TextStyle(
                    color:
                        AppTheme.of(context).colorScheme.main.primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(width: 10),
              widget.isNumberChosen
                  ? Icon(
                      Icons.check_outlined,
                      size: 12,
                      color: AppTheme.of(context).colorScheme.main.accentColor,
                    )
                  : Text(''),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: [
              SizedBox(width: 15),
              Text(
                !widget.isMaxNumberChosen
                    ? 'Выберите 8 чисел'
                    : 'Выбрано максимум чисел',
                style: TextStyle(
                    color:
                        AppTheme.of(context).colorScheme.main.primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          color: AppTheme.of(context).colorScheme.main.primaryTextColor,
          child: SizedBox(
            height: 1,
            width: MediaQuery.sizeOf(context).width - 50,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        DigitField(
          ticketID: widget.ticket.id,
          cost: widget.ticket.cost,
          tappedDigits: widget.tappedDigits,
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: [
              SizedBox(width: 15),
              Text(
                'Вторая часть поля',
                style: TextStyle(
                    color:
                        AppTheme.of(context).colorScheme.main.primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: [
              SizedBox(width: 15),
              Text(
                'Выберите минимум 1 число',
                style: TextStyle(
                    color:
                        AppTheme.of(context).colorScheme.main.primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
