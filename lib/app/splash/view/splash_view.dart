import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/splash/cubit/splash_cubit.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/common_widgets/logo_victor.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/spaces.dart';
import '../../../utils/theme/colors/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<SplashCubit>(context);
    cubit.checkLogin(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primaryColor,
        body: Column(
          children: [
            heightSpace(context.height * 0.1),
            Center(child: LogoVictor(size: 0.42)),
            heightSpace(context.height * 0.03),
            largeTitle("tagLine".tr(), ColorManager.whiteColor, true),
            heightSpace(context.height * 0.07),
            largeTitle("introSentence".tr(), ColorManager.whiteColor, false),
          ],
        )
    );
  }
}
