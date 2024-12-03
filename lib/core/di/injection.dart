import 'package:finfly/features/auth/cubit/auth_cubit.dart/auth_cubit.dart';
import 'package:finfly/features/home/cubit/home_cubit.dart';
import 'package:finfly/features/intro/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:finfly/features/intro/cubit/splash_cubit/splash_cubit.dart';
import 'package:finfly/features/settings/cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:finfly/features/auth/cubit/auth_type_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // External
  _external();

  // Cubit
  _cubits();
}

//SECTION - Cubits
_cubits() {
  sl.registerFactory(() => AuthTypeCubit());
  sl.registerFactory(() => SplashCubit());
  sl.registerFactory(() => OnboardingCubit());
  sl.registerFactory(() => AuthCubit());
  sl.registerFactory(() => ThemeCubit());
  sl.registerFactory(() => OrdersCubit());
}

//SECTION - External
_external() {
  sl.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
}
