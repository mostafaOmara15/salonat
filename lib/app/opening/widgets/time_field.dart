import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';

class TimeField extends StatelessWidget {
  const TimeField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("From", style: TextStyle(fontSize: 20)),
        Container(
          width: context.width * 0.2,
          height: context.height * 0.035,
          padding: EdgeInsets.only(top: 6, left: context.width * 0.04),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)
          ),
          child: const TextField(
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '09:00 am',
            ),
          ),
        ),
      ],
    );
  }
}
