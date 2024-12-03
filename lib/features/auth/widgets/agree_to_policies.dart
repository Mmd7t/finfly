import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';

class AgreeToPoliciesTile extends StatelessWidget {
  const AgreeToPoliciesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.all(0),
      value: false,
      onChanged: (value) {},
      title: Wrap(
        children: [
          'I agree to the '.tr().bodySmall(context),
          InkWell(
            onTap: () {},
            child: 'Terms & Conditions'.tr().bodySmall(
                  context,
                  weight: FontWeight.bold,
                  color: context.color.primary,
                ),
          ),
          ' and '.tr().bodySmall(context),
          InkWell(
            onTap: () {},
            child: 'Privacy Policy'.tr().bodySmall(
                  context,
                  weight: FontWeight.bold,
                  color: context.color.primary,
                ),
          ),
        ],
      ),
    );
  }
}
