import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:salonat/app/booking/view/booking_view.dart';
import 'package:salonat/app/notifications/view/notifications_view.dart';
import 'package:salonat/app/offers/cubit/offer_cubit.dart';
import 'package:salonat/app/offers/view/offers_view.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import '../../profile/view/profile_screen.dart';

class AppLayout extends StatelessWidget {
  AppLayout({super.key});

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      const ProfileScreen(),
      BlocProvider<OfferCubit>(
        create: (context) => OfferCubit(),
        child: const OffersView(),
      ),
      BlocProvider<OfferCubit>(
        create: (context) => OfferCubit(),
        child:  BookingScreen(),
      ),
      // BookingScreen(),
      const NotificationScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_outlined),
          title: ("Profile"),
          iconSize: context.height * 0.03,
          activeColorPrimary: ColorManager.activeColor,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.percent),
          title: ("Offers"),
          iconSize: context.height * 0.03,
          activeColorPrimary: ColorManager.activeColor,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.calendar_today_outlined),
          title: ("Booking"),
          iconSize: context.height * 0.03,
          activeColorPrimary: ColorManager.activeColor,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.notifications_none),
          title: ("Notifications"),
          iconSize: context.height * 0.035,
          activeColorPrimary: ColorManager.activeColor,
          inactiveColorPrimary: Colors.white,
        ),
      ];
    }

    return PersistentTabView(
      context,
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
    );
  }
}