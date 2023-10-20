import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name/theme/app_theme.dart';
import 'package:new_recipes/features/main_home/bloc/digit_field_block_bloc.dart';
import 'package:new_recipes/features/main_home/presentetion/one_ticket/digit_grid_view.dart';
import 'package:new_recipes/features/main_home/models/one_ticket_model.dart';

class OneTicketView extends StatefulWidget {
  const OneTicketView(
      {required this.ticket,
      required this.isNumberChosen,
      required this.isMaxNumberChosen,
      required this.tappedDigits,
      super.key});

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
              const SizedBox(width: 15),
              Text(
                'Билет ${widget.ticket.id}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    onPressed: () {
                      context.read<DigitFieldBlockBloc>().add(OpenDigitField());
                    },
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
              const SizedBox(width: 15),
              Text(
                'Первая часть поля',
                style: TextStyle(
                    color:
                        AppTheme.of(context).colorScheme.main.primaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(width: 10),
              if (widget.isNumberChosen)
                Icon(
                  Icons.check_outlined,
                  size: 12,
                  color: AppTheme.of(context).colorScheme.main.accentColor,
                )
              else
                const Text(''),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: [
              const SizedBox(width: 15),
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
        const SizedBox(
          height: 10,
        ),
        Container(
          color: AppTheme.of(context).colorScheme.main.primaryTextColor,
          child: SizedBox(
            height: 1,
            width: MediaQuery.sizeOf(context).width - 50,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        DigitGridView(
          ticketID: widget.ticket.id,
          cost: widget.ticket.cost,
          tappedDigits: widget.tappedDigits,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: [
              const SizedBox(width: 15),
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
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Row(
            children: [
              const SizedBox(width: 15),
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
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
