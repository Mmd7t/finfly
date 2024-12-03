import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/features/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finfly/config/constants/app_variables.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    var themeCubit = context.watch<ThemeCubit>().state;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          '${AppVariables.illustrationsPath}auth_bg.svg',
          width: context.width,
          colorFilter: ColorFilter.mode(
              (themeCubit is LightState)
                  ? context.color.primary
                  : AppColors.darkCard,
              BlendMode.srcATop),
        ),
        Positioned(
          bottom: 180,
          left: 0,
          right: 0,
          child: 'logo with border'.coloredIcon(),
        ),
        Positioned(
          bottom: 130,
          left: 0,
          right: 0,
          child: Center(child: "FinFLY".titleLarge(context)),
        ),
      ],
    );
  }
}
