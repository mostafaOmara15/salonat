import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/app/edit_services/cubit/edit_service_cubit.dart';
import 'package:salonat/app/services/model/main_services_model.dart';
import 'package:salonat/app/services/model/sub_services_model.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/common_widgets/inputField.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';

import '../../../utils/theme/colors/color_manager.dart';

class EditServicesView extends StatefulWidget {
  MainServicesModel mainServicesModel;
  SubServicesModel subServicesModel;

  EditServicesView(
      {super.key,
      required this.mainServicesModel,
      required this.subServicesModel});

  @override
  State<EditServicesView> createState() => _EditServicesViewState();
}

class _EditServicesViewState extends State<EditServicesView> {
  late EditServiceCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<EditServiceCubit>(context);
    cubit.descriptionEn.text = widget.subServicesModel.descriptionen!;
    cubit.descriptionAr.text = widget.subServicesModel.descriptionar!;
    cubit.serviceNameEn.text = widget.subServicesModel.titleen!;
    cubit.serviceNameAr.text = widget.subServicesModel.titlear!;
    cubit.price.text = widget.subServicesModel.price!;
    cubit.duration.text = widget.subServicesModel.duration!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
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
                    validator: (value) {}),
              ),
              widthSpace(context.width / 50),
              SizedBox(
                height: context.height / 20,
                width: context.width / 4,
                child: InputField(
                    hint: "service_price".tr(),
                    inputType: TextInputType.text,
                    controller: cubit.price,
                    icon: Icons.add,
                    validator: (value) {}),
              ),
            ],
          ),
          heightSpace(10),
          SizedBox(
            height: context.height / 20,
            child: InputField(
                hint: "service_duration".tr(),
                inputType: TextInputType.text,
                controller: cubit.duration,
                icon: Icons.add,
                validator: (value) {}),
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
                validator: (value) {}),
          ),
          heightSpace(20),
          SizedBox(
            height: context.height / 20,
            child: InputField(
                hint: "service_name_ar".tr(),
                inputType: TextInputType.text,
                controller: cubit.serviceNameAr,
                icon: Icons.add,
                validator: (value) {}),
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
                validator: (value) {}),
          ),
          heightSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width / 5),
            child: AppButton(
                title: "done".tr(),
                onTap: () async {
                  await cubit
                      .editService(
                    mainServiceID: widget.mainServicesModel.id!,
                    subServicesModel: widget.subServicesModel,
                  )
                      .then(
                    (value) {
                      Navigator.pop(context, true);
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
