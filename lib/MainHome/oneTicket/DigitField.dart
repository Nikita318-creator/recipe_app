import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name/theme/app_theme.dart';
import 'package:new_recipes/MainHome/oneTicket/DigitFieldModel.dart';

import 'package:new_recipes/MainHome/bloc/digit_field_block_bloc.dart';

class DigitField extends StatefulWidget {
  DigitField(
      {super.key,
      required this.ticketID,
      required this.cost,
      required this.tappedDigits});

  List<bool> isActiveButtons = initiateIsActiveButtons();
  final List<int> tappedDigits;
  final String ticketID;
  final String cost;

  @override
  State<DigitField> createState() => DigitFieldState();
}

class DigitFieldState extends State<DigitField> {
  @override
  Widget build(BuildContext context) {
    if (widget.tappedDigits.isNotEmpty) {
      widget.isActiveButtons =
          initiateIsActiveButtonsOnStateExist(widget.tappedDigits);
    }
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
                                context.read<DigitFieldBlockBloc>().add(
                                    RemoveDigit(
                                        tappedDigit: tapped,
                                        ticketId: int.parse(widget.ticketID)));
                                print(widget.tappedDigits);
                              } else {
                                context.read<DigitFieldBlockBloc>().add(
                                    AddDigit(
                                        tappedDigit: tapped,
                                        ticketId: int.parse(widget.ticketID)));
                                print(widget.tappedDigits);
                              }
                              setState(() {
                                widget.isActiveButtons[tapped] =
                                    !widget.isActiveButtons[tapped];
                              });
                              if (widget.tappedDigits.length == 7 &&
                                  widget.isActiveButtons[tapped]) {
                                print(widget.tappedDigits);
                                showModalBottomSheet<void>(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20)),
                                    ),
                                    builder: (BuildContext innerContext) {
                                      return SizedBox(
                                        height: 80,
                                        child: Center(
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.black87)),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  60,
                                              height: 48,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      'Оплатить ${widget.ticketID} билет'),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Container(
                                                    color: AppTheme.of(context)
                                                        .colorScheme
                                                        .main
                                                        .primaryTextColor,
                                                    child: SizedBox(
                                                      height: 20,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    '${widget.cost} Р',
                                                    style: TextStyle(
                                                        color: Colors.amber),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<DigitFieldBlockBloc>()
                                                  .add(MakePayment());
                                              Navigator.pop(innerContext);
                                            },
                                          ),
                                        ),
                                      );
                                    });
                              }
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

List<bool> initiateIsActiveButtonsOnStateExist(List<int> tappedDigits) {
  List<bool> isActive = initiateIsActiveButtons();

  for (int tappedDigit in tappedDigits) {
    isActive[tappedDigit] = true;
  }

  return isActive;
}
