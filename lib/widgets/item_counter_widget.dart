import 'package:flutter/material.dart';

class ItemCounterWidget extends StatelessWidget {
  final String itemPath;
  final String counter;
  final Color color;
  const ItemCounterWidget({super.key, required this.itemPath, required this.counter, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(itemPath),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
          decoration: BoxDecoration(
              color: color,
              borderRadius:
              BorderRadius.all(Radius.circular(100.0))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                counter,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
