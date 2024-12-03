import 'package:flutter/material.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';

extension CustomInputDecoration on InputDecoration {
  static InputDecoration decorate(BuildContext context,
      {required String hintText,
      String? prefixIcon,
      String? suffixIcon,
      Widget? suffix,
      Color? suffixColor,
      Color? fillColor,
      VoidCallback? onSuffixTap}) {
    return InputDecoration(
      hintText: hintText,
      fillColor: fillColor,
      prefixIcon: prefixIcon != null
          ? prefixIcon.iconProvider(context, color: context.color.primary)
          : const SizedBox(),
      prefixIconConstraints: prefixIcon != null
          ? const BoxConstraints.expand(width: 60, height: 60)
          : const BoxConstraints.expand(width: 20, height: 20),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(22),
      suffixIconColor: context.color.secondary,
      suffix: Padding(
        padding: const EdgeInsetsDirectional.only(start: 15),
        child: suffix,
      ),
      suffixIconConstraints: (suffixIcon == null)
          ? const BoxConstraints.expand(width: 60, height: 22)
          : const BoxConstraints.expand(width: 60, height: 60),
      suffixIcon: (suffixIcon == null)
          ? null
          : IconButton(
              onPressed: onSuffixTap,
              icon: suffixIcon.icon(),
            ),
    );
  }
}
