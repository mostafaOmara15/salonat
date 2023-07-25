import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/login/view_model/cubit/login_cubit.dart';
import 'package:salonat/app/splash/view/splash_screen.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en') ,
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates:context.localizationDelegates ,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: ColorManager.primaryColor,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: const TextStyle(fontSize: 28, color: Colors.white, fontFamily: 'Fraunces'),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          fontFamily: 'Fraunces',
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
