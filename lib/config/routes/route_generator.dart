import 'package:finfly/core/di/injection.dart';
import 'package:finfly/features/home/cubit/home_cubit.dart';
import 'package:finfly/features/home/pages/graphs_page.dart';
import 'package:finfly/features/home/pages/home_page.dart';
import 'package:finfly/features/home/pages/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/core/widgets/global_appbar.dart';
import 'package:finfly/features/auth/pages/auth_page.dart';
import 'package:finfly/features/auth/pages/forget_password.dart';
import 'package:finfly/features/intro/pages/onboarding_page.dart';
import 'package:finfly/features/intro/pages/splash_page.dart';
import 'package:finfly/features/intro/pages/welcome_page.dart';
import '../../features/settings/pages/settings_page.dart';
import 'app_routes.dart';

class AppRouter {
  GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: Routes.main,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: Routes.auth,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: Routes.forget,
        builder: (context, state) => const ForgetPassword(),
      ),
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: Routes.orders,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<OrdersCubit>()..loadOrders(),
          child: const OrdersPage(),
        ),
      ),
      GoRoute(
        path: Routes.graphs,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<OrdersCubit>()..loadOrders(),
          child: const GraphsPage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: Scaffold(
          appBar: const GlobalAppBar(title: 'Error Occured'),
          body: Center(
            child: state.error!.message.body(context),
          ),
        ),
      );
    },
  );
}
