import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:salonat/app/booking/cubit/booking_cubit.dart';
import 'package:salonat/app/booking/view/booking_view.dart';
import 'package:salonat/app/layout/cubit/layout_cubit.dart';
import 'package:salonat/app/notifications/view/notifications_view.dart';
import 'package:salonat/app/offers/cubit/offer_cubit.dart';
import 'package:salonat/app/offers/view/offers_view.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/theme/colors/color_manager.dart';
import '../../profile/view/profile_view.dart';

class AppLayout extends StatelessWidget {
  AppLayout({super.key});

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      const ProfileView(),
      const OffersView(),
      BookingScreen(),
      NotificationScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_outlined),
          title: ("profile".tr()),
          iconSize: context.height * 0.025,
          activeColorPrimary: ColorManager.activeColor,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.percent),
          title: ("offers".tr()),
          iconSize: context.height * 0.025,
          activeColorPrimary: ColorManager.activeColor,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.calendar_today_outlined),
          title: ("bookings".tr()),
          iconSize: context.height * 0.025,
          activeColorPrimary: ColorManager.activeColor,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.notifications_none),
          title: ("notifications".tr()),
          iconSize: context.height * 0.03,
          activeColorPrimary: ColorManager.activeColor,
          inactiveColorPrimary: Colors.white,
        ),
      ];
    }

    return BlocBuilder<LayoutCubit,LayoutState>(builder: (context, state) =>

    PersistentTabView(

        context,

        onItemSelected: (int index) async {
          if (index == 1) {
          await  BlocProvider.of<OfferCubit>(context).getOffer();
               }
          if (index == 2) {
            await  BlocProvider.of<BookingCubit>(context).getBooking(
                date: DateFormat("yyyy-MM-dd", "en").format( BlocProvider.of<BookingCubit>(context).selectedDate));
          }

        },
        controller: _controller,
        screens: _buildScreens(),
        items: navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: ColorManager.primaryColor,
        decoration: const NavBarDecoration(colorBehindNavBar: Colors.white),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        navBarStyle: NavBarStyle.style6,
        itemAnimationProperties: const ItemAnimationProperties(duration: Duration(milliseconds: 200),curve: Curves.ease),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}