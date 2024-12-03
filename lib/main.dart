import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/core/di/injection.dart';
import 'package:finfly/features/auth/cubit/auth_cubit.dart/auth_cubit.dart';
import 'package:finfly/features/auth/cubit/auth_type_cubit.dart';
import 'package:finfly/features/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finfly/config/themes/themes.dart';
import 'package:finfly/core/database/shared_prefs.dart';
import 'package:finfly/core/di/injection.dart' as di;
import 'config/routes/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPrefsHelper.init();
  await di.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
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
//-------------------------------------> Theme Bloc Provider <-------------------------------------//
        BlocProvider<ThemeCubit>(
          create: (context) => sl<ThemeCubit>()..getThemeMode(),
        ),
//--------------------------------------> Auth Bloc Provider <-------------------------------------//
        BlocProvider<AuthCubit>(create: (context) => sl<AuthCubit>()),
        BlocProvider<AuthTypeCubit>(create: (context) => sl<AuthTypeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) => MaterialApp.router(
          title: 'FinFly',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: (state is LightState) ? ThemeMode.light : ThemeMode.dark,
          routeInformationProvider: AppRouter().router.routeInformationProvider,
          routeInformationParser: AppRouter().router.routeInformationParser,
          routerDelegate: AppRouter().router.routerDelegate,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
