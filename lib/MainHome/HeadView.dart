import 'package:flutter/material.dart';
import 'package:new_recipes/MainHome/HeadRow.dart';
import 'package:new_recipes/MainHome/SubHeadRow.dart';

class HeadView extends StatelessWidget {
  const HeadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xff2e3650), // общий цвет
      child: Column(
        children: [
          HeadRow(),
          Container(
            color: Colors.grey,
            child: SizedBox(
              height: 1,
              width: MediaQuery.sizeOf(context).width - 50,
            ),
          ),
          SubHeadRow(),
        ],
      ),
    );
  }
}
