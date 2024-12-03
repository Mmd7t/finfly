import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/features/intro/cubit/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';
import 'package:finfly/core/di/injection.dart';
import 'package:finfly/core/widgets/global_app_logo.dart';
import 'onboarding_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SplashCubit>()..startSplashTimeout(),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          if (state is SplashLoaded) {
            return const OnboardingPage();
          } else {
            return const SplashScreen();
          }
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlobalAppLogo(width: context.width * 0.5),
            const SizedBox(height: 50),
            "FinFLY".titleLarge(context),
          ],
        ),
      ),
    );
  }
}
