import 'package:flutter/material.dart';
import 'package:name/theme/app_theme.dart';
import 'package:new_recipes/features/main_home/presentetion/loto_view.dart';
// import 'package:name/theme/adaptive_theme.dart';

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
        title: const Text('Рапидо'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.of(context).colorScheme.main.backgroundTop,
        leading: Padding(
          padding: const EdgeInsets.all(5), // TODO: - Кнопки меньше сделать
          child: SizedBox(
            width: 50,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    AppTheme.of(context).colorScheme.main.backgroundMain),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
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
                      const Color.fromARGB(255, 62, 67, 83)),
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: const LotoView(),
    );
  }
}
