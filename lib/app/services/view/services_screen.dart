import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/app/services/widgets/service_bottom-sheet.dart';
import 'package:salonat/app/services/widgets/service_button.dart';
import 'package:salonat/app/services/widgets/service_tile.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  List salonServices = ["Facials Female", "Massages", "Body Treatment Female"];

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
                      return ServiceButton(title: salonServices[index], active: false,);
                    },
                  ),
                ),
              ),
              ServiceButton(title: "add".tr(), active: true),
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
                  return ServiceBottomSheet(serviceNameCtrl: serviceNameCtrl, serviceDurationCtrl: serviceDurationCtrl, serviceDescriptionCtrl: serviceDescriptionCtrl, serviceSalaryCtrl: serviceSalaryCtrl);
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