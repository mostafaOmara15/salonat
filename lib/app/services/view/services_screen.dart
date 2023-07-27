import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/app/services/widgets/service_button.dart';
import 'package:salonat/app/services/widgets/service_tile.dart';
import 'package:salonat/app/services/widgets/service_textfield.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  List salonServices = ["Facials Female", "Massages", "Body Treatment Female", "+Add"];
  TextEditingController serviceNameCtrl = TextEditingController();
  TextEditingController serviceDurationCtrl = TextEditingController();
  TextEditingController serviceDescriptionCtrl = TextEditingController();
  TextEditingController serviceSalaryCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('services'.tr().toUpperCase())),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: context.height *0.1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: salonServices.length,
                    itemBuilder: (context, index) {
                      return ServiceButton(title: salonServices[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ServiceTile(
                      serviceTitle: "Nirvana Acne/Oily Skin 60",
                      price: "SAR 630.00",
                      duration: "60 MINUTES",
                      details: "Acne and oily skin can be addressed with deep-pore and deep-tissue cleansing to rid the skins excess oils and stimulate the circulation."
                  ) ;
                },
              ),
            ),
          ),
          AppButton(
            title: "addService".tr(),
            onTap: (){
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heightSpace(context.height * 0.06),
                        Row(
                          children: [
                            ServiceTextField(hintText: "Service name", fieldCtrl: serviceNameCtrl, maxLines: 1, width: 0.6),
                            widthSpace(context.width * 0.01),
                            ServiceTextField(hintText: "SAR 000", fieldCtrl: serviceSalaryCtrl, maxLines: 1, width: 0.29),
                          ],
                        ),
                        heightSpace(context.height * 0.01),
                        ServiceTextField(hintText: "Service duration", fieldCtrl: serviceDurationCtrl, maxLines: 1, width: 0.6),
                        heightSpace(context.height * 0.01),
                        ServiceTextField(hintText: "Service description", fieldCtrl: serviceDescriptionCtrl, maxLines: 5, width: 1),
                        heightSpace(context.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppButton(title: "cancel".tr(), onTap: (){}),
                            widthSpace(context.width * 0.1),
                            AppButton(title: "done".tr(), onTap: (){}),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
          heightSpace(context.height * 0.05),
        ],
      ),
    );
  }
}