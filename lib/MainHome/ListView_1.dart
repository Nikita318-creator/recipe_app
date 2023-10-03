import 'package:flutter/material.dart';
// import 'package:new_recipes/pages/home_page.dart';

class ListView_1 extends StatefulWidget {
  const ListView_1({super.key});

  @override
  State<ListView_1> createState() => _ListView_1State();
}

class _ListView_1State extends State<ListView_1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Билет 1'),
          ],
        ),
      ],
    );
  }
}
