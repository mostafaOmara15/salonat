import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class ProfileTile extends StatelessWidget {
  String title;
  bool withButton;

  ProfileTile({required this.title, required this.withButton});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 18),),
      trailing: withButton
        ? SizedBox(
          height: context.height * 0.03,
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(backgroundColor: ColorManager.primaryColor, elevation: 0),
            child: const Text("Edit", style: TextStyle(color: Colors.white),)
          ),
        )
        : IconButton(icon: const Icon(Icons.arrow_forward_ios_rounded),
            onPressed: (){}
        )
    );
  }
}
