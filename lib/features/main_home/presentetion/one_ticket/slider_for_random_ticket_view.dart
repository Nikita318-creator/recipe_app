// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:name/theme/app_theme.dart';

class SliderForRandomTicketView extends StatefulWidget {
  SliderForRandomTicketView({
    required this.title,
    required this.count,
    required this.maxPossibleValue,
    super.key,
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
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
                        if (widget.count > 1) {
                          widget.count--;
                        }
                      });
                    },
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    '${widget.count} ${widget.title}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
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
                        if (widget.count < widget.maxPossibleValue) {
                          widget.count++;
                        }
                      });
                    },
                    child: const Icon(
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
              onChanged: (value) {
                setState(() {
                  widget.count = value.toInt();
                });
              },
            ),
          ],
        ));
  }
}
