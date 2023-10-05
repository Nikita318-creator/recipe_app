import 'package:flutter/material.dart';
// import 'package:new_recipes/MainHome/HeadView.dart';
import 'package:name/theme/app_theme.dart';
import "../MainHome/MainHome.dart";
import 'package:flutter/cupertino.dart';
import 'package:new_recipes/timer/view/timer_page.dart';
import 'package:new_recipes/PizzaBloc/pizza_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose app'),
        centerTitle: true,
        backgroundColor: AppTheme.of(context).colorScheme.main.backgroundTop,
      ),
      body: Center(
        child: Column(children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) => const MainHome())),
            child: const Text('Open Loto Page'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) => const TimerPage())),
            child: const Text('Open Timer Page'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () => Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) => const PizzaPage())),
            child: const Text('Open Pizza Page'),
          ),
        ]),
      ),
    );
  }
}
