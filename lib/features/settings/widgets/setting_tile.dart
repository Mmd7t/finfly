import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';

class SettingTile extends StatelessWidget {
  final String? title;
  final bool isSwitchTile;
  final bool switchValue;
  final bool isLanguageTile;
  final VoidCallback? onTap;
  final Function(bool?)? onChanged;
  const SettingTile({
    super.key,
    this.title,
    this.switchValue = false,
    this.isSwitchTile = false,
    this.isLanguageTile = false,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return (isSwitchTile
            ? SwitchListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                value: switchValue,
                onChanged: onChanged,
                activeColor: AppColors.green,
                activeTrackColor: AppColors.green.withOpacity(0.1),
                inactiveTrackColor: AppColors.orange.withOpacity(0.1),
                inactiveThumbColor: AppColors.orange,
                trackOutlineColor:
                    const WidgetStatePropertyAll<Color>(Colors.transparent),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                title: title!.body(context),
              )
            : ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                onTap: onTap,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                title: title!.body(context),
                trailing: (isLanguageTile)
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          (context.locale == const Locale('ar', 'EG')
                                  ? 'عربي'
                                  : 'EN')
                              .bodySmall(context,
                                  color: AppColors.orange,
                                  weight: FontWeight.bold),
                          const SizedBox(width: 8),
                          'arrow'.trColoredIcon(context),
                        ],
                      )
                    : 'arrow'.trColoredIcon(context),
              ))
        .decorate(context);
  }
}
