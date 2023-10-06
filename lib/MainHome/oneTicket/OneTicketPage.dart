import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_recipes/MainHome/oneTicket/OneTicketModel.dart';
import 'package:new_recipes/MainHome/oneTicket/DigitField.dart';
import 'package:name/theme/app_theme.dart';

class OneTicketPage extends StatelessWidget {
  OneTicketPage({super.key, required this.ticket});

  final OneTicketModel ticket;
  bool _isNumberChoosen = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: Row(
              children: [
                SizedBox(width: 15),
                Text(
                  'Билет ${ticket.id}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButton(
                      color: AppTheme.of(context)
                          .colorScheme
                          .main
                          .primaryTextColor,
                      onPressed: () {},
                      icon: const Icon(Icons.brush_outlined),
                    ),
                    IconButton(
                      color: AppTheme.of(context)
                          .colorScheme
                          .main
                          .primaryTextColor,
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
                      color: AppTheme.of(context)
                          .colorScheme
                          .main
                          .primaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(width: 10),
                _isNumberChoosen
                    ? Icon(
                        Icons.check_outlined,
                        size: 12,
                        color:
                            AppTheme.of(context).colorScheme.main.accentColor,
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
                  'Выберите 8 чисел',
                  style: TextStyle(
                      color: AppTheme.of(context)
                          .colorScheme
                          .main
                          .primaryTextColor,
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
          DigitField(),
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
                      color: AppTheme.of(context)
                          .colorScheme
                          .main
                          .primaryTextColor,
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
                      color: AppTheme.of(context)
                          .colorScheme
                          .main
                          .primaryTextColor,
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
      ),
    );
  }
}
