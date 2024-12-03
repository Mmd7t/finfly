import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';

class SigninOptions extends StatelessWidget {
  const SigninOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: AppColors.orange,
                indent: 10,
                endIndent: 20,
                thickness: 1,
              ),
            ),
            'or sign in with'
                .tr()
                .labelSmall(context, color: context.color.secondary),
            const Expanded(
              child: Divider(
                color: AppColors.orange,
                indent: 20,
                endIndent: 10,
                thickness: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                width: 30,
                height: 30,
                child: 'google'.icon(),
              ).decorate(
                context,
                padding: const EdgeInsets.all(18),
              ),
            ),
            const SizedBox(width: 15),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                width: 30,
                height: 30,
                child: 'facebook'.icon(),
              ).decorate(
                context,
                padding: const EdgeInsets.all(18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
