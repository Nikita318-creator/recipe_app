import 'package:flutter/material.dart';
// import 'package:new_recipes/pages/home_page.dart';

class SubHeadRow extends StatefulWidget {
  const SubHeadRow({super.key});

  @override
  State<SubHeadRow> createState() => _SubHeadRowState();
}

class _SubHeadRowState extends State<SubHeadRow> {
  var isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff2e3650),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ToggleButtons(
              borderColor: const Color(0xff2e3650),
              fillColor: const Color(0xff2e3650),
              borderWidth: 0,
              selectedColor: Colors.white,
              isSelected: isSelected,
              onPressed: (index) {
                setState(
                  () {
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected[buttonIndex] = true;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  },
                );
              },
              children: [
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 40) / 2,
                  child: Text('Выбор чисел'),
                ),
                Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 40) / 2,
                  child: Text('Мультиставка'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}