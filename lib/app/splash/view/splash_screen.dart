import 'dart:async';
import 'package:flutter/material.dart';
import 'package:salonat/app/login/view/login_screen.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/common_widgets/logo_victor.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import '../../../utils/spaces.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => context.pushReplacement(const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Column(
        children: [
          heightSpace(
            context.height * 0.1,
          ),
          Center(child: LogoVictor(size: 0.42)),
          heightSpace(
            context.height * 0.03,
          ),
          const Text(
            "For our partners",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          heightSpace(
            context.height * 0.1,
          ),
          const Text(
            "ONE STEP TO BEAUTY",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
