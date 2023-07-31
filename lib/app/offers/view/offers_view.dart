import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/offer_details/cubit/offer_details_cubit.dart';
import 'package:salonat/app/offer_details/view/offer_details_view.dart';
import 'package:salonat/app/offers/cubit/offer_cubit.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/common_widgets/inputField.dart';
import 'package:salonat/utils/common_widgets/sup_button.dart';
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
    cubit!.offerDesc1.text = "Get eyelashes extensions, eyebrows liftin";
    cubit!.offerAmount.text = "Get 30% off";
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: context.height / 2.1,
                    child: Column(
                      children: [

                        heightSpace(context.height / 50),
                        Stack(
                          children: [
                            Image.asset("assets/images/offer.png",
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: context.height / 2.8),
                            Positioned(
                                right: 0,
                                top: 0,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: CircleAvatar(
                                        maxRadius: 15,
                                        backgroundColor: ColorManager.greyColor,
                                        child: const Icon(
                                          Icons.clear,
                                        )))),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: context.height / 50,
                              child: Container(
                                height: context.height / 8,
                                color: ColorManager.greyColor.withOpacity(0.8),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 8),
                                  child: Row(children: [
                                    Expanded(
                                        child: InputField(
                                      maxLine: 5,
                                      icon: Icons.percent,
                                      hint: "",
                                      inputType: TextInputType.text,
                                      validator: (value) {},
                                      controller: cubit!.offerDesc1,
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            
                                            padding: EdgeInsets.symmetric(
                                              horizontal: context.width / 30,
                                            ),
                                            height: context.height / 60,
                                            child: InputField(
                                              icon: Icons.percent,
                                              hint: "",
                                              inputType: TextInputType.text,
                                              validator: (value) {},
                                              controller: cubit!.offerAmount,
                                            ),
                                          ),
                                        ),
                                        heightSpace(context.width / 60),


                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: context.width / 30,
                                              ),
                                              child: SupButton(
                                                  onTap: () {},
                                                  title: "edit".tr(), height:context .height/10,),

                                        ),
                                          ),
                                        heightSpace(context.width / 60),
                                      ],
                                    ))
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 1),
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
