import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/app/about/cubit/about_cubit.dart';
import 'package:salonat/app/add_offer/cubit/add_offer_cubit.dart';
import 'package:salonat/app/add_services/cubit/add_service_cubit.dart';
import 'package:salonat/app/add_staff/cubit/add_staff_cubit.dart';
import 'package:salonat/app/booking_details/cubit/booking_details_cubit.dart';
import 'package:salonat/app/edit_offer/cubit/edit_offer_cubit.dart';
import 'package:salonat/app/edit_services/cubit/edit_service_cubit.dart';
import 'package:salonat/app/edit_staff/cubit/edit_staff_cubit.dart';
import 'package:salonat/app/layout/cubit/layout_cubit.dart';
import 'package:salonat/app/login/cubit/login_cubit.dart';
import 'package:salonat/app/offers/cubit/offer_cubit.dart';
import 'package:salonat/app/opening/cubit/opening_time_cubit.dart';
import 'package:salonat/app/profile/cubit/profile_cubit.dart';
import 'package:salonat/app/reviews/cubit/review_cubit.dart';
import 'package:salonat/app/services/cubit/services_cubit.dart';
import 'package:salonat/app/splash/cubit/splash_cubit.dart';
import 'package:salonat/app/splash/view/splash_view.dart';
import 'package:salonat/app/staff/cubit/staff_cubit.dart';
import 'package:salonat/firebase_options.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/utils/block_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:salonat/utils/theme/colors/color_manager.dart';

import 'app/booking/cubit/booking_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  setupLocator();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('ar')],
      startLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => AboutCubit()),
        BlocProvider(create: (context) => BookingCubit()),
        BlocProvider(create: (context) => OfferCubit()),
        BlocProvider(create: (context) => EditOfferCubit()),
        BlocProvider(create: (context) => AddOfferCubit()),
        BlocProvider(create: (context) => ServicesCubit()),
        BlocProvider(create: (context) => StaffCubit()),
        BlocProvider(create: (context) => EditServiceCubit()),
        BlocProvider(create: (context) => AddServiceCubit()),
        BlocProvider(create: (context) => EditStaffCubit()),
        BlocProvider(create: (context) => AddStaffCubit()),
        BlocProvider(create: (context) => BookingDetailsCubit()),
        BlocProvider(create: (context) => OpeningTimeCubit()),
        BlocProvider(create: (context) => ReviewCubit()),
        BlocProvider(create: (context) => LayoutCubit()),

      ],
      child: MaterialApp(
        builder: (context, child) => MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), child: child!),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: ColorManager.whiteColor,
            bottomSheetTheme:
                BottomSheetThemeData(backgroundColor: ColorManager.whiteColor),
            appBarTheme: AppBarTheme(
              color: ColorManager.primaryColor,
              elevation: 0,
              scrolledUnderElevation: 0,
              centerTitle: true,
              titleTextStyle: GoogleFonts.fraunces(
                  textStyle: const TextStyle(letterSpacing: 0.5, fontSize: 24)),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            fontFamily: 'Fraunces',
            useMaterial3: true,
          ),
          home: const SplashView(),
          ),
    );
  }
}
