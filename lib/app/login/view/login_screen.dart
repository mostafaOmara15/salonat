import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/app/layout/view/app_layout.dart';
import 'package:salonat/app/login/widgets/login_button.dart';
import 'package:salonat/app/login/widgets/login_form_field.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/common_widgets/logo_victor.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/spaces.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  bool showPass = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorManager.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(context.width * 0.05),
        child: ListView(
          children: [
            Column(
              children: [
                heightSpace(context.height * 0.03),
                LogoVictor(size: 0.3),
                heightSpace(context.height * 0.02),
                SubTitle(text: "tagLine".tr(), color: ColorManager.whiteColor, isBold: true),
                heightSpace(context.width * 0.15),
                LoginFormField(
                  fieldCtrl: userNameCtrl,
                  withIcon: false,
                  fieldIcon: Icons.email_outlined,
                  isSecured: false,
                  fieldInput: TextInputType.name,
                  fieldHint: "useName".tr(),
                ),
                heightSpace(context.width * 0.05),

                LoginFormField(
                  fieldCtrl: passwordCtrl,
                  fieldIcon: Icons.lock_outline_rounded,
                  fieldHint: "Password",
                  fieldInput: TextInputType.visiblePassword,
                  isSecured: showPass,
                  withIcon: true,
                  showPass: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                ),
                heightSpace(context.width * 0.05),
                LoginButton(function: () {
                  context.pushReplacement(AppLayout());
                }),
                heightSpace(context.width * 0.1),
                SubTitle(text: "introSentence".tr(), color: ColorManager.whiteColor, isBold: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
