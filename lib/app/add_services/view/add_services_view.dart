import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/app/add_services/cubit/add_service_cubit.dart';
import 'package:salonat/app/services/model/main_services_model.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/common_widgets/inputField.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../utils/theme/colors/color_manager.dart';

class AddServices extends StatefulWidget {
  MainServicesModel mainServicesModel;

  AddServices({super.key, required this.mainServicesModel});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  late AddServiceCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<AddServiceCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key:cubit. formKey,

        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            heightSpace(50),
            AutoSizeText(
              widget.mainServicesModel.titleen!,
              style: GoogleFonts.fraunces(
                textStyle: TextStyle(
                    color: ColorManager.blackColor,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w400),
              ),
              textAlign: TextAlign.start,
              minFontSize: 18,
              maxFontSize: 22,
              maxLines: 2,
            ),
            heightSpace(20),

            Row(
              children: [
                SizedBox(
                  height: context.height / 20,
                  width: context.width / 1.5,
                  child: InputField(
                      hint: "service_name_en".tr(),
                      inputType: TextInputType.text,
                      controller: cubit.serviceNameEn,
                      icon: Icons.add,
                      validator: cubit.textValidator()),
                ),
                widthSpace(context.width / 50),
                SizedBox(
                  height: context.height / 20,
                  width: context.width / 4,
                  child: InputField(
                      hint: "service_price".tr(),
                      inputType: TextInputType.number,
                      controller: cubit.price,
                      icon: Icons.add,
                      validator: cubit.textValidator()),
                ),
              ],
            ),
            heightSpace(10),
            SizedBox(
              height: context.height / 20,
              child: InputField(
                  hint: "service_duration".tr(),
                  suffexText: "minute".tr(),
                  inputType: TextInputType.number,
                  controller: cubit.duration,
                  icon: Icons.add,
                  validator: cubit.textValidator()),
            ),
            heightSpace(10),
            SizedBox(
              height: context.height / 8,
              child: InputField(
                  hint: "service_des_en".tr(),
                  inputType: TextInputType.text,
                  controller: cubit.descriptionEn,
                  icon: Icons.add,
                  maxLine: 5,
                  validator: cubit.textValidator()),
            ),
            heightSpace(20),
            SizedBox(
              height: context.height / 20,
              child: InputField(
                  hint: "service_name_ar".tr(),
                  inputType: TextInputType.text,
                  controller: cubit.serviceNameAr,
                  icon: Icons.add,
                  validator: cubit.textValidator()),
            ),
            heightSpace(10),
            SizedBox(
              height: context.height / 8,
              child: InputField(
                  maxLine: 5,
                  hint: "service_des_ar".tr(),
                  inputType: TextInputType.text,
                  controller: cubit.descriptionAr,
                  icon: Icons.add,
                  validator: cubit.textValidator()),
            ),
            heightSpace(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width / 5),
              child: AppButton(
                  title: "done".tr(),
                  onTap: () async {
                    if(cubit.formKey.currentState!.validate()){
                      await cubit.addService(mainServiceID: widget.mainServicesModel.id!).then(
                            (value) {
                          Navigator.pop(context, true);
                        },
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
