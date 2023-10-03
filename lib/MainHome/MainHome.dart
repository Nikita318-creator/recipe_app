import 'package:flutter/material.dart';
import 'package:new_recipes/MainHome/HeadView.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          // PreferredSize(
          //   preferredSize: Size.fromHeight(100.0), // here the desired height
          // child:
          AppBar(
        title: Text('Рапидо'),
        centerTitle: true,
        backgroundColor: const Color(0xff2e3650),
        leading: Padding(
          padding: const EdgeInsets.all(5), // TODO: - Кнопки меньше сделать
          child: SizedBox(
            width: 50,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 62, 67, 83)),
              ),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              width: 50,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 62, 67, 83)),
                ),
                onPressed: () {},
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: HeadView(),
    );
  }
}