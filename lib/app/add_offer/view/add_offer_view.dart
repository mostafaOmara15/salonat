import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/add_offer/cubit/add_offer_cubit.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/theme/colors/color_manager.dart';
import '../../edit_offer/view/offer_info_field.dart';
import '../widget/offer_description.dart';

class AddOffersView extends StatefulWidget {
  const AddOffersView({super.key});

  @override
  State<AddOffersView> createState() => _AddOffersViewState();
}

class _AddOffersViewState extends State<AddOffersView> {
  late AddOfferCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<AddOfferCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('offers'.tr().toUpperCase())),
      body: BlocBuilder<AddOfferCubit, OffDetailsState>(
        builder: (context, state) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(context.width * 0.03),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heightSpace(context.height * 0.01),
                      largeTitle(
                          "add_offer".tr(), ColorManager.greyColor100, false),
                      heightSpace(context.height * 0.01),
                      cubit.offerImageUrl != null
                          ? Image.network(cubit.offerImageUrl!,
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  height: context.height / 2.8)
                              .onTap(() {
                              cubit.pickImage();
                            })
                          : Container(
                              color: ColorManager.greyColor,
                              width: double.infinity,
                              height: context.height / 2.8,
                              padding: EdgeInsets.symmetric(
                                  vertical: context.height / 7),
                              child: Center(
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
                                  cubit.pickImage();
                                }),
                              ),
                            ),
                      heightSpace(context.height * 0.02),
                      largeBody("Add offer description",
                          ColorManager.greyColor100, false),
                      OfferDescription(
                        controller: cubit.enDescription,
                        hint: "",
                        isAr: false,
                        validator: cubit.textValidator(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          largeBody("اضف وصف العرض", ColorManager.greyColor100,
                              false),
                        ],
                      ),
                      OfferDescription(
                        controller: cubit.arDescription,
                        hint: "",
                        isAr: true,
                        validator: cubit.textValidator(),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: OfferInfo(
                            title: "startDate".tr(),
                            isDate: true,
                            dateController: cubit.startDateController,
                            validator: cubit.textValidator(),
                          )),
                          widthSpace(context.width * 0.05),
                          Expanded(
                              child: OfferInfo(
                            title: "endDate".tr(),
                            isDate: true,
                            dateController: cubit.endDateController,
                            validator: cubit.textValidator(),
                          )),
                        ],
                      ),
                      heightSpace(context.height * 0.01),
                      Row(
                        children: [
                          Expanded(
                              child: OfferInfo(
                            title: "priceBefore".tr(),
                            isDate: false,
                            dateController: cubit.priceBeforeController,
                            validator: cubit.textValidator(),
                          )),
                          widthSpace(context.width * 0.05),
                          Expanded(
                              child: OfferInfo(
                            title: "priceAfter".tr(),
                            isDate: false,
                            dateController: cubit.priceAfterController,
                            validator: cubit.textValidator(),
                          )),
                        ],
                      ),
                      heightSpace(context.height * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppButton(onTap: () {}, title: "cancel".tr()),
                          widthSpace(context.width / 10),
                          AppButton(
                              onTap: () async {
                                await cubit.addOffer().then((value) {
                                  Navigator.pop(context, true);
                                });
                              },
                              title: "done".tr())
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
