import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/layout/view/app_layout.dart';
import 'package:salonat/app/login/view_model/cubit/login_cubit.dart';
import 'package:salonat/app/login/widgets/login_button.dart';
import 'package:salonat/app/login/widgets/login_form_field.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/common_widgets/logo_victor.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/spaces.dart';
import '../view_model/cubit/login_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, LoginStates state) {},
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.get(context);
          return Form(
            key: loginCubit.loginKey,
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: ColorManager.primaryColor,
              body: Padding(
                padding: EdgeInsets.all(context.width * 0.05),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        LogoVictor(size: 0.3),
                        heightSpace(context.height * 0.02),
                        largeTitle("tagLine".tr(), ColorManager.whiteColor, true),
                        heightSpace(context.width * 0.15),

                        LoginFormField(
                          fieldCtrl: loginCubit.userNameCtrl,
                          withIcon: false,
                          fieldIcon: Icons.email_outlined,
                          isSecured: false,
                          fieldInput: TextInputType.name,
                          fieldHint: "userName".tr(),
                        ),

                        heightSpace(context.width * 0.05),

                        LoginFormField(
                          fieldCtrl: loginCubit.passwordCtrl,
                          fieldIcon: Icons.lock_outline_rounded,
                          fieldHint: "Password",
                          fieldInput: TextInputType.visiblePassword,
                          isSecured: loginCubit.showPass,
                          withIcon: true,
                          showPass: () {
                            setState(() {
                              loginCubit.changePasswordVisibility();
                            });
                          },
                        ),
                        heightSpace(context.width * 0.05),
                        LoginButton(function: () {
                          context.pushReplacement(AppLayout());
                        }),
                        heightSpace(context.width * 0.05),
                        largeTitle("introSentence".tr(), ColorManager.whiteColor, false),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
