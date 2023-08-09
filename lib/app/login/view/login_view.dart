import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/login/cubit/login_cubit.dart';
import 'package:salonat/app/login/cubit/login_states.dart';
import 'package:salonat/app/login/widgets/login_button.dart';
import 'package:salonat/app/login/widgets/login_form_field.dart';
import 'package:salonat/utils/common_widgets/language_buttons.dart';
import 'package:salonat/utils/common_widgets/loading_indicator.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/common_widgets/logo_victor.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/spaces.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (BuildContext context, LoginStates state) {},
      builder: (context, state) {
        LoginCubit loginCubit = LoginCubit.get(context);
        return Stack(children: [
          Form(
            key: loginCubit.loginKey,
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: ColorManager.primaryColor,
              body: Padding(
                padding: EdgeInsets.all(context.width * 0.05),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        LogoVictor(size: 0.3),
                        heightSpace(context.height * 0.02),
                        largeTitle(
                            "tagLine".tr(), ColorManager.whiteColor, true),
                        heightSpace(context.width * 0.075),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            LanguageButtons(
                              language: "En",
                              active: loginCubit.en,
                              onTap: () {
                                context.setLocale(const Locale('en'));
                                loginCubit.changeToEnglish();
                              },
                            ),
                            widthSpace(context.width * 0.03),
                            LanguageButtons(
                              language: "Ar",
                              active: loginCubit.ar,
                              onTap: () {
                                context.setLocale(const Locale('ar'));
                                loginCubit.changeToArabic();
                              },
                            ),
                          ],
                        ),
                        heightSpace(context.width * 0.075),
                        LoginFormField(
                          validate: loginCubit.emailValidator(),
                          fieldCtrl: loginCubit.userNameCtrl,
                          withIcon: false,
                          fieldIcon: Icons.email_outlined,
                          isSecured: false,
                          fieldInput: TextInputType.name,
                          fieldHint: "userName".tr(),
                        ),
                        heightSpace(context.width * 0.05),
                        LoginFormField(
                          validate: loginCubit.passwordValidator(),
                          fieldCtrl: loginCubit.passwordCtrl,
                          fieldIcon: Icons.lock_outline_rounded,
                          fieldHint: "password".tr(),
                          fieldInput: TextInputType.visiblePassword,
                          isSecured: loginCubit.showPass,
                          withIcon: true,
                          showPass: () {
                            loginCubit.changePasswordVisibility();
                          },
                        ),
                        heightSpace(context.width * 0.05),
                        LoginButton(function: () async {
                          await loginCubit.login(context: context);
                        }),
                        heightSpace(context.width * 0.05),
                        largeTitle("introSentence".tr(),
                            ColorManager.whiteColor, false),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (state is LoginLoadingState) centerIndicator(),
        ]);
      },
    );
  }
}
