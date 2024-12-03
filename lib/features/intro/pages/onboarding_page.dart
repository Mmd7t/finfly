import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/features/intro/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:finfly/config/constants/shared_prefs_keys.dart';
import 'package:finfly/config/enums/enums.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';
import 'package:finfly/config/routes/app_routes.dart';
import 'package:finfly/core/database/shared_prefs.dart';
import 'package:finfly/core/di/injection.dart';
import 'package:finfly/core/widgets/global_button.dart';
import 'package:finfly/features/intro/widgets/headers.dart';
import 'package:finfly/features/intro/widgets/onbarding_content.dart';
import '../widgets/arrow_button.dart';

class OnboardingPage extends HookWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentPage = useState(0);
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 1000));
    double animation =
        useAnimation<double>(Tween(begin: 0.25, end: 1.25).animate(controller));

    useEffect(() {
      controller.animateTo(
        currentPage.value / 4,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );

      return null;
    }, []);

    return Scaffold(
      body: BlocProvider<OnboardingCubit>(
        create: (context) => sl<OnboardingCubit>(),
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            var bloc = BlocProvider.of<OnboardingCubit>(context);
            return SafeArea(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 8),
                      Headers(
                        currentPage: currentPage.value,
                        backOnPressed: () {
                          bloc.backTo();
                          currentPage.value--;
                          controller.animateBack(currentPage.value / 4);
                        },
                        skipOnPressed: () {
                          bloc.goToLastPage();
                          currentPage.value = 3;
                          controller.animateTo(
                            1.0,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      Expanded(
                        child: PageView.builder(
                          itemCount: 4,
                          controller: bloc.pageController,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value) {
                            currentPage.value = value;
                            controller.animateTo(
                              currentPage.value / 4,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          itemBuilder: (context, index) =>
                              OnboardingContent(index: index),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      switchInCurve: Curves.easeInOutBack,
                      switchOutCurve: Curves.easeInOutBack,
                      transitionBuilder: (child, animation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                                  begin: const Offset(0.0, 2.0),
                                  end: const Offset(0.0, 0.0))
                              .animate(animation),
                          child: child,
                        );
                      },
                      child: (currentPage.value == 3)
                          ? GlobalButton(
                              onTap: () {
                                SharedPrefsHelper.save<bool>(
                                    SharedPrefsKeys.firstTime, false);
                                context.push(Routes.welcome);
                              },
                              type: BtnType.withoutIcon,
                              text: 'Get Started'.tr(),
                              width: context.width * 0.7,
                            )
                          : ArrowButton(
                              currentPage: currentPage.value,
                              animation: animation,
                              controller: controller,
                              onPressed: () {
                                if (currentPage.value < 3 &&
                                    currentPage.value >= 0) {
                                  BlocProvider.of<OnboardingCubit>(context)
                                      .nextTo();
                                  currentPage.value++;
                                  controller.animateTo(
                                    currentPage.value / 4,
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
