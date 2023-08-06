import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/add_services/cubit/add_service_cubit.dart';
import 'package:salonat/app/add_services/view/add_services_view.dart';
import 'package:salonat/app/edit_services/view/edit_services_view.dart';
import 'package:salonat/app/services/cubit/services_cubit.dart';
import 'package:salonat/app/services/widgets/service_tile.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/common_widgets/loading_indecator.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/spaces.dart';

import '../../edit_services/cubit/edit_service_cubit.dart';

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
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: context.height * 0.03,
                                horizontal: context.width * 0.02),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      cubit.mainServiceIndex == index
                                          ? ColorManager.greyColor
                                          : ColorManager.primaryColor,
                                  elevation: 0),
                              onPressed: () {
                                cubit.mainServiceIndex = index;
                                cubit.emit(ServicesLoaded());
                              },
                              child: smallTitle(
                                "current_language_iso".tr() == "en"
                                    ? cubit.mainServices[index].titleen!
                                    : cubit.mainServices[index].titlear!,
                                ColorManager.opacityBlackColor,
                                false,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  child: cubit.mainServices[cubit.mainServiceIndex]
                          .subServicesModel.isEmpty
                      ? Center(
                          child: largeTitle(
                              "no_service".tr(), ColorManager.blackColor, true))
                      : ListView.builder(
                          itemCount: cubit.mainServices[cubit.mainServiceIndex]
                              .subServicesModel.length,
                          itemBuilder: (context, index) {
                            return ServiceTile(
                              onTapDelete: () async {
                                await cubit.deleteSubService(
                                    subServiceID: cubit
                                        .mainServices[cubit.mainServiceIndex]
                                        .subServicesModel[index]
                                        .id
                                        .toString());
                                cubit.mainServiceIndex = 0;
                                cubit.mainServices.clear();
                                await cubit.getMainServices();
                              },
                              onTapEdit: () async {
                                var result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider<EditServiceCubit>(
                                        create: (context) => EditServiceCubit(),
                                        child: EditServicesView(
                                          mainServicesModel: cubit.mainServices[
                                              cubit.mainServiceIndex],
                                          subServicesModel: cubit
                                              .mainServices[
                                                  cubit.mainServiceIndex]
                                              .subServicesModel[index],
                                        ),
                                      ),
                                    ));
                                if (result == true) {
                                  cubit.mainServiceIndex = 0;
                                  cubit.mainServices.clear();
                                  cubit.getMainServices();
                                }
                              },
                              serviceTitle: "current_language_iso".tr() == "en"
                                  ? cubit.mainServices[cubit.mainServiceIndex]
                                      .subServicesModel[index].titleen!
                                  : cubit.mainServices[cubit.mainServiceIndex]
                                      .subServicesModel[index].titlear!,
                              price: cubit.mainServices[cubit.mainServiceIndex]
                                      .subServicesModel[index].price! +
                                  "sar".tr(),
                              duration: cubit
                                  .mainServices[cubit.mainServiceIndex]
                                  .subServicesModel[index]
                                  .duration!,
                              details: "current_language_iso".tr() == "en"
                                  ? cubit.mainServices[cubit.mainServiceIndex]
                                      .subServicesModel[index].descriptionen!
                                  : cubit.mainServices[cubit.mainServiceIndex]
                                      .subServicesModel[index].descriptionar!,
                            );
                          },
                        ),
                ),
              ),
              AppButton(
                title: "addService".tr(),
                onTap: () async {
                  var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider<AddServiceCubit>(
                          create: (context) => AddServiceCubit(),
                          child: AddServices(
                              mainServicesModel:
                                  cubit.mainServices[cubit.mainServiceIndex]),
                        ),
                      ));
                  if (result == true) {
                    cubit.mainServiceIndex = 0;
                    cubit.mainServices.clear();
                    cubit.getMainServices();
                  }
                  final snackBar = SnackBar(
                    content: Text('service_added'.tr()),
                    backgroundColor: Colors.green,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
