import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/enums/enums.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/core/widgets/global_button.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          'Select App Language'.tr().titleMedium(context),
          const SizedBox(height: 30),
          Row(
            textDirection: TextDirection.ltr,
            children: [
              Expanded(
                child: GlobalButton(
                  onTap: () {
                    context.pop();
                    context.setLocale(const Locale('ar', 'EG'));
                  },
                  text: 'Arabic'.tr(),
                  textColor: (context.locale == const Locale('ar', 'EG'))
                      ? context.color.surface
                      : AppColors.orange,
                  type: (context.locale == const Locale('ar', 'EG'))
                      ? BtnType.withIcon
                      : BtnType.withoutIcon,
                  color: (context.locale == const Locale('ar', 'EG'))
                      ? AppColors.green
                      : Colors.white,
                  icon: (context.locale == const Locale('ar', 'EG'))
                      ? 'check'
                      : '',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GlobalButton(
                  onTap: () {
                    context.pop();
                    context.setLocale(const Locale('en', 'US'));
                  },
                  text: 'English'.tr(),
                  textColor: (context.locale == const Locale('en', 'US'))
                      ? context.color.surface
                      : AppColors.orange,
                  type: (context.locale == const Locale('en', 'US'))
                      ? BtnType.withIcon
                      : BtnType.withoutIcon,
                  color: (context.locale == const Locale('en', 'US'))
                      ? AppColors.green
                      : Colors.white,
                  icon: (context.locale == const Locale('en', 'US'))
                      ? 'check'
                      : '',
                ),
              ),
            ],
          ),
        ],
      ).decorate(context, padding: const EdgeInsets.all(20)),
    );
  }
}
