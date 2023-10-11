import 'package:flutter/material.dart';
import 'package:name/theme/app_theme.dart';

class SliderForRandomTicketView extends StatefulWidget {
  SliderForRandomTicketView({
    super.key,
    required this.title,
    required this.count,
    required this.maxPossibleValue,
  });

  final String title;
  int count;
  final int maxPossibleValue;

  @override
  State<SliderForRandomTicketView> createState() =>
      SliderForRandomTicketViewState();
}

class SliderForRandomTicketViewState extends State<SliderForRandomTicketView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black12),
                    ),
                    onPressed: () {
                      setState(() {
                        widget.count--;
                      });
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  '${widget.count} ${widget.title}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ), // TODO: - get state from block
                SizedBox(
                  height: 40,
                  width: 40,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black12),
                    ),
                    onPressed: () {
                      setState(() {
                        widget.count++;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Slider(
              value: widget.count.toDouble(),
              activeColor: AppTheme.of(context).colorScheme.main.accentColor,
              min: 1,
              max: widget.maxPossibleValue.toDouble(),
              label: widget.count.toString(),
              onChanged: (double value) {
                setState(() {
                  widget.count = value.toInt();
                });
              },
            ),
          ],
        ));
  }
}
