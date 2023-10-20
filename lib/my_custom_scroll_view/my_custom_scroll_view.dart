import 'package:flutter/material.dart';

class MyCustomScrollView extends StatelessWidget {
  const MyCustomScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Custom Scroll View'),
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back, color: Colors.black),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            // const SliverAppBar(
            //   pinned: true,
            //   expandedHeight: 250,
            //   backgroundColor: Colors.blue,
            //   flexibleSpace: FlexibleSpaceBar(
            //     title: Text(
            //       'Demo',
            //       style: TextStyle(color: Colors.amber),
            //     ),
            //   ),
            // ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 80,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text('${index + 1}'),
                  );
                },
                childCount: 20,
              ),
            ),
            // SliverFixedExtentList(
            //   itemExtent: 50,
            //   delegate: SliverChildBuilderDelegate(
            //     (context, index) {
            //       return Container(
            //         alignment: Alignment.center,
            //         color: Colors.lightBlue[100 * (index % 9)],
            //         child: Text('List Item $index'),
            //       );
            //     },
            //   ),
            // ),
          ],
        ));
  }
}
