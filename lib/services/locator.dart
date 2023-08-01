import 'package:get_it/get_it.dart';
import 'package:salonat/services/shared_pref.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<SharedPrefServices>(SharedPrefServices());
}
