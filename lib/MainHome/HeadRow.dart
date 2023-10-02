import 'package:flutter/material.dart';
// import 'package:new_recipes/pages/home_page.dart';

class HeadRow extends StatelessWidget {
  const HeadRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff2e3650),
        child: const SizedBox(
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  radius: 48, // Image radius
                  foregroundImage: AssetImage('assets/images/prise.png'),
                  // height: 80,
                  // width: 80,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Суперприз 500 000 ₽',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Тираж 1234 • через 2 ч',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
