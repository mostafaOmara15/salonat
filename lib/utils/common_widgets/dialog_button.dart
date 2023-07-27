import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../extensions/theme/colors/color_manager.dart';

class AlertButton extends StatelessWidget {
  String title;
  AlertButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: context.height * 0.035,
        child: ElevatedButton(
            onPressed: () {Navigator.of(context).pop();},
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.buttonColor,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),)
            ),
            child: Text(title, style: const TextStyle(color: Colors.white))
        ),
      ),
    );
  }
}
