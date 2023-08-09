import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../theme/colors/color_manager.dart';

class AlertButton extends StatelessWidget {
  String title;
  Function() onTap;

  AlertButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: context.height * 0.035,
        child: ElevatedButton(
            onPressed: onTap,
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
