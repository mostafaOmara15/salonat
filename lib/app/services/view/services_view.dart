import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/services/cubit/services_cubit.dart';
import 'package:salonat/app/services/widgets/service_bottom-sheet.dart';
import 'package:salonat/app/services/widgets/service_button.dart';
import 'package:salonat/app/services/widgets/service_tile.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/common_widgets/loading_indecator.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/spaces.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  late ServicesCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<ServicesCubit>(context);
    cubit.getMainServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('services'.tr().toUpperCase())),
      body:
          BlocBuilder<ServicesCubit, ServicesState>(builder: (context, state) {
        if (state is ServicesLoaded) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: context.height * 0.1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.mainServices.length,
                        itemBuilder: (context, index) {
                          return
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:  ColorManager.primaryColor ,
                                    elevation: 0),
                                onPressed: (){
                                  cubit.getSubServices(mainServiceId:cubit.mainServices[index].id );
                                },
                                child: smallTitle( "current_language_iso".tr() == "en"
                                ? cubit.mainServices[index].titleen!
                                : cubit.mainServices[index].titlear!, ColorManager.opacityBlackColor, false)
                            );
                          //   ServiceButton(
                          //   title: "current_language_iso".tr() == "en"
                          //       ? cubit.mainServices[index].titleen!
                          //       : cubit.mainServices[index].titlear!,
                          //   active: false,
                          //   onTap: (){
                          //     cubit.getSubServices(mainServiceId:cubit.mainServices[index] );
                          //
                          //   },
                          // );
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
                          details:
                              "Acne and oily skin can be addressed with deep-pore and deep-tissue cleansing to rid the skins excess oils and stimulate the circulation.");
                    },
                  ),
                ),
              ),
              AppButton(
                title: "addService".tr(),
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return ServiceBottomSheet(
                          serviceNameCtrl: cubit.serviceNameCtrl,
                          serviceDurationCtrl: cubit.serviceDurationCtrl,
                          serviceDescriptionCtrl: cubit.serviceDescriptionCtrl,
                          serviceSalaryCtrl: cubit.serviceSalaryCtrl);
                    },
                  );
                },
              ),
              heightSpace(context.height * 0.05),
            ],
          );
        } else {
          return centerIndicator();
        }
      }),
    );
  }
}
