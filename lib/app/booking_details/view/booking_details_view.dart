import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/booking/model/booking_model.dart';
import 'package:salonat/app/booking_details/cubit/booking_details_cubit.dart';
import 'package:salonat/utils/common_widgets/loading_indicator.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';

import '../../../utils/theme/colors/color_manager.dart';

class BookingDetailsView extends StatefulWidget {
  BookingModel bookingModel;

  BookingDetailsView({super.key, required this.bookingModel});

  @override
  State<BookingDetailsView> createState() => _BookingDetailsViewState();
}

class _BookingDetailsViewState extends State<BookingDetailsView> {
  late BookingDetailsCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<BookingDetailsCubit>(context);
    cubit.getSubServiceAndStaff(
        bookingServices: widget.bookingModel.bookingservice!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primaryColor,
          title: Text("more_details".tr(),
              style: const TextStyle(fontSize: 22, color: Colors.white)),
          centerTitle: true,
        ),
        body: BlocBuilder<BookingDetailsCubit, BookingDetailsState>(
            builder: (context, state) {
          if (state is BookingDetailsSuccess) {
            return ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: context.height / 80, horizontal: 8),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.blackColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: context.height / 5.5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              mediumBody(
                                "client_name".tr(),
                                ColorManager.blackColor,
                                false,
                              ),
                              mediumBody(
                                "date".tr(),
                                ColorManager.blackColor,
                                false,
                              ),
                              mediumBody(
                                "time".tr(),
                                ColorManager.blackColor,
                                false,
                              ),
                              mediumBody(
                                "reservation_amount".tr(),
                                ColorManager.blackColor,
                                false,
                              ),
                              mediumBody(
                                "status".tr(),
                                ColorManager.blackColor,
                                false,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              mediumBody(
                                widget.bookingModel.clientname,
                                ColorManager.greyColor200,
                                false,
                              ),
                              mediumBody(
                                widget.bookingModel.bookingdate,
                                ColorManager.greyColor200,
                                false,
                              ),
                              mediumBody(
                                widget.bookingModel.time,
                                ColorManager.greyColor200,
                                false,
                              ),
                              mediumBody(
                                "${widget.bookingModel.amount!} ${"sar".tr()}",
                                ColorManager.greyColor200,
                                false,
                              ),
                              mediumBody(
                                widget.bookingModel.status.toString(),
                                ColorManager.greyColor200,
                                false,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  decoration: BoxDecoration(
                    color: ColorManager.white200Color,
                    border: Border.all(color: ColorManager.blackColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      heightSpace(10),
                      Center(
                        child: mediumTitle(
                            "Service", ColorManager.greyColor200, true),
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                mediumBody(
                                  "current_language_iso".tr() == "en"
                                      ? cubit.subServices[index].titleen
                                      : cubit.subServices[index].titlear,
                                  ColorManager.blackColor,
                                  false,
                                ),
                                mediumBody(
                                  "SAR ${cubit.subServices[index].price}",
                                  ColorManager.blackColor,
                                  false,
                                ),
                              ],
                            ),
                            subtitle:
                            Column(
                            children: [mediumBody(
                              "current_language_iso".tr() == "en"
                                  ? cubit.subServices[index].descriptionen
                                  : cubit.subServices[index].descriptionar,
                              ColorManager.greyColor200,
                              false,
                            ),
heightSpace(5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: mediumBody(
                                        "staff_name".tr(),
                                        ColorManager.blackColor,
                                        false,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: mediumBody(
                                      cubit.staff[index].name,
                                      ColorManager.greyColor200,
                                      false,
                                    ),
                                  ),
                                ],
                              ),
                              heightSpace(10),
                              const Divider(),
                            ]),
                          );
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit.subServices.length,
                      ),

                    ],
                  ),
                ),
              ],
            );
          } else {
            return centerIndicator();
          }
        }));
  }
}
