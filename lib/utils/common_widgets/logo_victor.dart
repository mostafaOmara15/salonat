import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';

class LogoVictor extends StatelessWidget {
  double size;

  LogoVictor({required this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/logo.png", width: context.width * size,);
  }
}
