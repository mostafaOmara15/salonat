import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/offer_details/cubit/offer_details_cubit.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/common_widgets/inputField.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:salonat/utils/spaces.dart';

import '../../../utils/common_widgets/texts.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class OffersDetailsView extends StatefulWidget {
  const OffersDetailsView({super.key});

  @override
  State<OffersDetailsView> createState() => _OffersDetailsViewState();
}

class _OffersDetailsViewState extends State<OffersDetailsView> {
  OfferDetailsCubit? cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<OfferDetailsCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: Text("offers".tr(),
            style: const TextStyle(fontSize: 22, color: Colors.white)),
        centerTitle: true,
      ),
      body: BlocBuilder<OfferDetailsCubit, OffDetailsState>(
        builder: (context, state) {
          return ListView(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: context.height / 2.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace(context.height / 50),
                    mediumTitle(
                        "add_offer".tr(), ColorManager.greyColor100, false),
                    heightSpace(context.height / 50),
                    Stack(
                      children: [
                        cubit!.image != null
                            ? Image.file(cubit!.image!,
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                    height: context.height / 2.8)
                                .onTap(() {
                                cubit!.pickImage();
                              })
                            : Container(
                                color: ColorManager.greyColor,
                                width: double.infinity,
                                height: context.height / 2.8,
                                padding: EdgeInsets.symmetric(
                                    vertical: context.height / 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: ColorManager.greyColor100,
                                    ),
                                    mediumTitle("add_pic".tr(),
                                        ColorManager.greyColor100, false),
                                  ],
                                ).onTap(() {
                                  cubit!.pickImage();
                                }),
                              ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: context.height / 50,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            height: context.height / 8,
                            color: ColorManager.greyColor100.withOpacity(0.8),
                            child: Row(children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: context.height / 60),
                                child: InputField(
                                  maxLine: 5,
                                  icon: Icons.percent,
                                  hint: "add_offer_desc".tr(),
                                  inputType: TextInputType.text,
                                  validator: (value) {},
                                  controller: cubit!.offerDescription,
                                ),
                              )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: context.height / 70,
                                    horizontal: 1),
                                child: VerticalDivider(
                                  thickness: 0.5,
                                  color: ColorManager.whiteColor,
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: context.width / 30,
                                          vertical: context.width / 60),
                                      height: context.height / 60,
                                      child: InputField(
                                        enableIcon: true,
                                        icon: Icons.percent,
                                        hint: "",
                                        inputType: TextInputType.text,
                                        validator: (value) {},
                                        controller: cubit!.offerAmount,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: context.width / 30,
                                          vertical: context.width / 60),
                                      height: context.height / 60,
                                      child: InputField(
                                        icon: Icons.percent,
                                        hint: "",
                                        inputType: TextInputType.text,
                                        validator: (value) {},
                                        controller: cubit!.offerDescription2,
                                      ),
                                    ),
                                  )
                                ],
                              ))
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(onTap: () {}, title: "cancel".tr()),
                  widthSpace(context.width / 10),
                  AppButton(onTap: () {}, title: "done".tr())
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
