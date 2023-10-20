import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name/theme/app_theme.dart';
import 'package:new_recipes/features/main_home/bloc/digit_field_block_bloc.dart';
import 'package:new_recipes/features/main_home/models/digit_field_model.dart';

// ignore: must_be_immutable
class DigitGridView extends StatefulWidget {
  DigitGridView(
      {required this.ticketID,
      required this.cost,
      required this.tappedDigits,
      super.key});

  List<bool> isActiveButtons = initiateIsActiveButtons();
  final List<int> tappedDigits;
  final String ticketID;
  final String cost;

  @override
  State<DigitGridView> createState() => DigitGridViewState();
}

class DigitGridViewState extends State<DigitGridView> {
  @override
  Widget build(BuildContext context) {
    if (widget.tappedDigits.isNotEmpty) {
      widget.isActiveButtons =
          initiateIsActiveButtonsOnStateExist(widget.tappedDigits);
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      height: MediaQuery.of(context).size.width - 200,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 40,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    final tapped = index;
                    if (widget.isActiveButtons[tapped]) {
                      context
                          .read<DigitFieldBlockBloc>()
                          .add(RemoveDigit(tappedDigit: tapped));
                    } else {
                      context
                          .read<DigitFieldBlockBloc>()
                          .add(AddDigit(tappedDigit: tapped));
                    }
                    setState(() {
                      widget.isActiveButtons[tapped] =
                          !widget.isActiveButtons[tapped];
                    });
                    if (widget.tappedDigits.length == 7 &&
                        widget.isActiveButtons[tapped]) {
                      showModalBottomSheet<void>(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (innerContext) {
                            return SizedBox(
                              height: 80,
                              child: Center(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black87)),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    height: 48,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            'Оплатить ${widget.ticketID} билет'),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          color: AppTheme.of(context)
                                              .colorScheme
                                              .main
                                              .primaryTextColor,
                                          child: const SizedBox(
                                            height: 20,
                                            width: 1,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          '${widget.cost} Р',
                                          style: const TextStyle(
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
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: widget.isActiveButtons[index] //&&
                            // int.parse(widget.ticketID) == 1
                            ? AppTheme.of(context).colorScheme.main.accentColor
                            : Colors.black12,
                        borderRadius:
                            BorderRadius.all(const Radius.circular(10))),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

List<bool> initiateIsActiveButtons() {
  final isActive = <bool>[];

  for (var i = 0; i < DigitFieldModel.rowCount; i++)
    for (var i = 0; i < DigitFieldModel.columnCount; i++) {
      isActive.add(false);
    }

  return isActive;
}

List<bool> initiateIsActiveButtonsOnStateExist(List<int> tappedDigits) {
  final isActive = initiateIsActiveButtons();

  for (final tappedDigit in tappedDigits) {
    isActive[tappedDigit] = true;
  }

  return isActive;
}
