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
  String aboutAr;
  String aboutEn;

  AboutView({super.key, required this.aboutAr, required this.aboutEn});


  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  late AboutCubit aboutCubit;

  @override
  void initState() {
    super.initState();
    aboutCubit = AboutCubit.get(context);
    aboutCubit.englishAbout = TextEditingController(text: widget.aboutEn);
    aboutCubit.arabicAbout = TextEditingController(text: widget.aboutAr);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AboutCubit, AboutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('about'.tr().toUpperCase())),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: context.height * 0.7,
                  child: ListView(
                    children: [
                      AboutTextField(
                        controller: aboutCubit.englishAbout,
                        hint: "About the Salon...",
                        isAr: false
                      ),
                      AboutTextField(
                        controller: aboutCubit.arabicAbout,
                        hint: "...حول الصالون",
                        isAr: true
                      ),
                    ]
                  ),
                ),
                AppButton(
                    title: "save".tr(), 
                    onTap: () async {
                      await aboutCubit.updateAbout().then((value) => Navigator.pop(context, true));
                    }
                ),
                heightSpace(context.height * 0.03)
              ],
            ),
          )
        );
      },
    );
  }
}