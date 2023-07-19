import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';

class DayButtons extends StatelessWidget {
  String day;
  DayButtons({required this.day});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
      child: TextButton(
          child: Text(day, style: const TextStyle(fontSize: 20, color: Colors.black)),
          onPressed: (){}
      ),
    );
  }
}