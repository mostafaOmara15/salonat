import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/offer_details/cubit/offer_details_cubit.dart';
import 'package:salonat/app/offer_details/view/offer_details_view.dart';
import 'package:salonat/app/offers/cubit/offer_cubit.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/common_widgets/inputField.dart';
import 'package:salonat/utils/common_widgets/sup_button.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class OffersView extends StatefulWidget {
  const OffersView({super.key});

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  OfferCubit? cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<OfferCubit>(context);
    cubit!.offerDesc1.text = "Get eyelashes extensions, eyebrows lifting";
    cubit!.offerAmount.text = "Get 30% off";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('offers'.tr().toUpperCase())),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(context.width * 0.03),
                  child: Column(
                    children: [
                      heightSpace(context.height * 0.025),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/offer.png"),
                              fit: BoxFit.cover
                          ),
                        ),
                        height: context.height * 0.4,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(context.width * 0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset("assets/icons/delete_icon.png", width: context.width * 0.07,),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                                height: context.height * 0.14,
                                color: ColorManager.greyColor.withOpacity(0.8),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: context.height * 0.12,
                                          width: context.width * 0.55,
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(border: Border.all(color: ColorManager.opacityBlackColor, width: 0.5)),
                                          child: largeBody("Get eyelashes extensions, eyebrows lifting", ColorManager.whiteColor, true),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: context.width * 0.3,
                                              height: context.height * 0.05,
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(border: Border.all(color: ColorManager.opacityBlackColor, width: 0.5)),
                                              child: Center(child: largeBody("Get 30% off ", ColorManager.blackColor, true)),
                                            ),
                                            heightSpace(context.height * 0.01),
                                            Expanded(child: AppButton(title: "edit".tr(), onTap: (){}))
                                          ],
                                        )
                                      ],
                                    )
                                )
                            ),
                            heightSpace(context.width * 0.05),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: AppButton(
                onTap: () {
                  context.push(BlocProvider<OfferDetailsCubit>(
                    create: (context) => OfferDetailsCubit(),
                    child: const OffersDetailsView(),
                  ));
                },
                title: "add_offer".tr()),
          ),
        ],
      ),
    );
  }
}
