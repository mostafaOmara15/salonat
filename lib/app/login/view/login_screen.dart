import 'package:flutter/material.dart';
import 'package:salonat/app/layout/view/app_layout.dart';
import 'package:salonat/app/login/widgets/login_button.dart';
import 'package:salonat/app/login/widgets/login_form_field.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/common_widgets/logo_victor.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/spaces.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              heightSpace(context.height * 0.03),
              LogoVictor(size: 0.3),
              heightSpace(
                context.height * 0.02,
              ),
              const Text(
                "For our partners",
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
              heightSpace(context.width * 0.15),
              LoginFormField(fieldCtrl: userNameCtrl, hintText: ("Username")),
              heightSpace(context.width * 0.05),
              LoginFormField(fieldCtrl: passwordCtrl, hintText: ("Password")),
              heightSpace(context.width * 0.05),
              LoginButton(function: () {
                context.pushReplacement(AppLayout());
              }),
              heightSpace(context.width * 0.1),
              const Text(
                "ONE STEP TO BEAUTY",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
