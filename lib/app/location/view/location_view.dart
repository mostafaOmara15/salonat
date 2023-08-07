import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('location'.tr())),
      body: Center(
        child: Text('Location'),
      ),
    );
  }
}
