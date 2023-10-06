import 'package:flutter/material.dart';
import 'package:name/theme/app_theme.dart';
import 'package:new_recipes/MainHome/oneTicket/DigitFieldModel.dart';

class DigitField extends StatelessWidget {
  DigitField({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   for (int i = 0; i < DigitFieldModel.columnCount; i++)
    //   for (int j = 0; j < DigitFieldModel.rowCount; j++)
    //   child: ,
    // );

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
                            // style: TextButton.styleFrom(
                            //     fixedSize: Size.fromWidth(
                            //         MediaQuery.of(context).size.width / 6 - 17)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(5)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        AppTheme.of(context)
                                            .colorScheme
                                            .main
                                            .primaryTextColor),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14.0),
                                        side: BorderSide(color: Colors.grey)))),
                            onPressed: () {
                              // логика тапа
                            },
                            child: Text(
                              '${(i * DigitFieldModel.columnCount) + (j + 1)}',
                              // style: TextStyle(fontSize: 14)
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
