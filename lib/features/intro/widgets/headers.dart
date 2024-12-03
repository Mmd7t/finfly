import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/core/widgets/global_app_logo.dart';

class Headers extends StatelessWidget {
  final int currentPage;
  final VoidCallback skipOnPressed;
  final VoidCallback backOnPressed;
  const Headers({
    super.key,
    required this.currentPage,
    required this.backOnPressed,
    required this.skipOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedSwitcher(
            switchInCurve: Curves.easeInBack,
            switchOutCurve: Curves.easeOutBack,
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: (currentPage == 0)
                ? GlobalAppLogo(width: context.width * 0.2)
                : InkWell(
                    onTap: backOnPressed,
                    borderRadius: BorderRadius.circular(10),
                    splashColor: AppColors.orange.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.rotate(
                            angle: pi,
                            child: 'arrow'.trColoredIcon(context),
                          ),
                          const SizedBox(width: 5),
                          'Back'.tr().body(context),
                        ],
                      ),
                    ),
                  ),
          ),
          AnimatedSwitcher(
            switchInCurve: Curves.easeInBack,
            switchOutCurve: Curves.easeOutBack,
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: (currentPage == 3)
                ? const SizedBox()
                : InkWell(
                    onTap: skipOnPressed,
                    borderRadius: BorderRadius.circular(10),
                    splashColor: AppColors.orange.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          'Skip'.tr().body(context),
                          const SizedBox(width: 5),
                          'arrow'.trColoredIcon(context),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
