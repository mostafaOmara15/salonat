import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/app/about/cubit/about_cubit.dart';
import 'package:salonat/app/about/cubit/about_states.dart';
import 'package:salonat/app/about/widget/about_field.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';

import '../../../utils/spaces.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  late AboutCubit aboutCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aboutCubit = AboutCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AboutCubit, AboutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('about'.tr().toUpperCase())),
          body: ListView(
            children: [
              SizedBox(
                height: context.height * 0.8 ,
                child: Column(
                  children: [
                    AboutTextField(controller: aboutCubit.englishAbout, hint: "About the Salon...", isAr: false),
                    AboutTextField(controller: aboutCubit.arabicAbout, hint: "...حول الصالون", isAr: true),
                    const Spacer(),
                    AppButton(title: "save".tr(), onTap: (){}),
                  ],
                ),
              ),
            ]
          )
        );
      },
    );
  }
}
