import 'package:flutter/material.dart';

import '../../../utils/extensions/theme/colors/color_manager.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: const Text("offers", style: TextStyle(fontSize: 22, color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(child: Text("offers"),),
    );
  }
}
