import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name/theme/app_theme.dart';
import 'package:new_recipes/MainHome/oneTicket/DigitFieldModel.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_recipes/MainHome/bloc/digit_field_block_bloc.dart';

class DigitField extends StatefulWidget {
  DigitField({super.key});

  List<bool> isActiveButtons = initiateIsActiveButtons();

  @override
  State<DigitField> createState() => DigitFieldState();
}

class DigitFieldState extends State<DigitField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 80,
      child: Column(
        children: [
          for (int i = 0; i < DigitFieldModel.rowCount; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int j = 0; j < DigitFieldModel.columnCount; j++)
                  (i * DigitFieldModel.columnCount) + (j + 1) <= 20
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width / 6 - 25,
                          child: TextButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(5)),
                                backgroundColor:
                                    widget.isActiveButtons[(i * DigitFieldModel.columnCount) + (j + 1)]
                                        ? MaterialStateProperty.all<Color>(
                                            AppTheme.of(context)
                                                .colorScheme
                                                .main
                                                .accentColor)
                                        : MaterialStateProperty.all<Color>(
                                            AppTheme.of(context)
                                                .colorScheme
                                                .main
                                                .primaryTextColor),
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.black),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0), side: BorderSide(color: Colors.grey)))),
                            onPressed: () {
                              int tapped =
                                  (i * DigitFieldModel.columnCount) + (j + 1);
                              if (widget.isActiveButtons[tapped]) {
                                context
                                    .read<DigitFieldBlockBloc>()
                                    .add(AddDigit(tappedTicket: tapped));
                              } else {
                                context
                                    .read<DigitFieldBlockBloc>()
                                    .add(RemoveDigit(tappedTicket: tapped));
                              }
                              setState(() {
                                widget.isActiveButtons[tapped] =
                                    !widget.isActiveButtons[tapped];
                              });
                            },
                            child: Text(
                              '${(i * DigitFieldModel.columnCount) + (j + 1)}',
                            ),
                          ),
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width / 6 - 25,
                          child: Text(''))
              ],
            ),
        ],
      ),
    );
  }
}

List<bool> initiateIsActiveButtons() {
  List<bool> isActive = [];

  for (int i = 0; i < DigitFieldModel.rowCount; i++)
    for (int i = 0; i < DigitFieldModel.columnCount; i++) isActive.add(false);

  return isActive;
}
