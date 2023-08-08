import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/add_offer/view/offer_info_field.dart';
import 'package:salonat/app/edit_offer/cubit/edit_offer_cubit.dart';
import 'package:salonat/app/offers/model/offer_model.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';
import '../widget/offer_description.dart';

class EditOfferView extends StatefulWidget {
  OfferModel offerModel;

  EditOfferView({super.key, required this.offerModel});

  @override
  State<EditOfferView> createState() => _EditOfferViewState();
}

class _EditOfferViewState extends State<EditOfferView> {
  late EditOfferCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<EditOfferCubit>(context);
    cubit.priceBeforeController.text = widget.offerModel.pricebefore!;
    cubit.priceAfterController.text = widget.offerModel.priceafter!;
    cubit.endDateController.text = widget.offerModel.enddate!;
    cubit.startDateController.text = widget.offerModel.startdate!;
    cubit.arDescription.text = widget.offerModel.descriptionar!;
    cubit.enDescription.text = widget.offerModel.descriptionen!;
    cubit.offerImageUrl = widget.offerModel.image!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('offers'.tr().toUpperCase())),
      body: BlocBuilder<EditOfferCubit, EditOfferState>(
        builder: (context, state) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(context.width * 0.03),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heightSpace(context.height * 0.01),
                      largeTitle(
                          "add_offer".tr(), ColorManager.greyColor100, false),
                      heightSpace(context.height * 0.01),
                      cubit!.offerImageUrl != null
                          ? Image.network(cubit!.offerImageUrl!,
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
                                  cubit!.pickImage();
                                }),
                              ),
                            ),
                      heightSpace(context.height * 0.02),
                      largeBody("Add offer description",
                          ColorManager.greyColor100, false),
                      OfferDescription(
                          controller: cubit.enDescription,
                          hint: "",
                          isAr: false),
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
                          isAr: true),
                      Row(
                        children: [
                          Expanded(
                              child: OfferInfo(
                            title: "startDate".tr(),
                            isDate: true,
                            dateController: cubit.startDateController,
                          )),
                          widthSpace(context.width * 0.05),
                          Expanded(
                              child: OfferInfo(
                            title: "endDate".tr(),
                            isDate: true,
                            dateController: cubit.endDateController,
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
                                  dateController: cubit.priceBeforeController)),
                          widthSpace(context.width * 0.05),
                          Expanded(
                              child: OfferInfo(
                                  title: "priceAfter".tr(),
                                  isDate: false,
                                  dateController: cubit.priceAfterController)),
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
                                await cubit.editOffer(offerId: widget.offerModel.id!);
                                Navigator.pop(context, true);
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
