import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/add_offer/view/add_offer_view.dart';
import 'package:salonat/app/edit_offer/view/edit_offer_view.dart';
import 'package:salonat/app/offers/cubit/offer_cubit.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../utils/common_widgets/loading_indicator.dart';
import '../../../utils/theme/colors/color_manager.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('offers'.tr().toUpperCase())),
        body: BlocBuilder<OfferCubit, OfferState>(
          builder: (context, state) {
            if (state is OfferLoading) {
              return centerIndicator();
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit!.offers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(context.width * 0.03),
                          child: Column(
                            children: [
                              heightSpace(context.height * 0.025),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          cubit!.offers[index].image!),
                                      //AssetImage("assets/images/offer.png"),
                                      fit: BoxFit.cover),
                                ),
                                height: context.height * 0.4,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.all(context.width * 0.03),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            "assets/icons/delete_icon.png",
                                            width: context.width * 0.07,
                                          ).onTap(() async {
                                            await cubit!.deleteOffer(cubit!
                                                .offers[index].id
                                                .toString());
                                          }),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                        height: context.height * 0.14,
                                        color: ColorManager.greyColor
                                            .withOpacity(0.8),
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 8),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: context.height * 0.12,
                                                  width: context.width * 0.55,
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: ColorManager
                                                              .opacityBlackColor,
                                                          width: 0.5)),
                                                  child: largeBody(
                                                      "current_language_iso"
                                                                  .tr() ==
                                                              "en"
                                                          ? cubit!.offers[index]
                                                              .descriptionen
                                                          : cubit!.offers[index]
                                                              .descriptionar,
                                                      ColorManager.whiteColor,
                                                      true),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width:
                                                          context.width * 0.3,
                                                      height:
                                                          context.height * 0.05,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: ColorManager
                                                                  .opacityBlackColor,
                                                              width: 0.5)),
                                                      child: Center(
                                                          child: largeBody(
                                                              "Get ${(((double.parse(cubit!.offers[index].pricebefore.toString()) - double.parse(cubit!.offers[index].priceafter.toString())) / double.parse(cubit!.offers[index].pricebefore.toString())) * 100).toStringAsFixed(0)} % off ",
                                                              ColorManager
                                                                  .blackColor,
                                                              true)),
                                                    ),
                                                    heightSpace(
                                                        context.height * 0.01),
                                                    Expanded(
                                                      child: AppButton(
                                                        title: "edit".tr(),
                                                        onTap: () async {
                                                          var result =
                                                              await Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        EditOfferView(
                                                                            offerModel:
                                                                                cubit!.offers[index]),
                                                                  ));
                                                          if (result == true) {
                                                            cubit!.offers
                                                                .clear();
                                                            await cubit!
                                                                .getOffer();
                                                          }
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ))),
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
                        onTap: () async {
                          var result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddOffersView(),
                              ));

                          if (result == true) {
                            cubit!.offers.clear();
                            await cubit!.getOffer();
                          }
                        },
                        title: "add_offer".tr()),
                  ),
                ],
              );
            }
          },
        ));
  }
}
