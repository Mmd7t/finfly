import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/features/intro/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/core/widgets/global_app_logo.dart';

class OnboardingContent extends StatelessWidget {
  final int index;
  const OnboardingContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<OnboardingCubit>(context);
    return Column(
      children: [
        Expanded(
          child: (index == 3)
              ? GlobalAppLogo(width: context.width * 0.7)
              : bloc.onboardingList[index].img.coloredIcon(
                  width: context.width * 0.8,
                  isIllustration: true,
                ),
        ),
        Expanded(
          child: Column(
            children: [
              "FinFLY".titleLarge(context, color: context.color.primary),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: bloc.onboardingList[index].body.body(
                  context,
                  color: AppColors.textColor2,
                  align: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
