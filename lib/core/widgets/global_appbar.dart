import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const GlobalAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: title!.titleLarge(context),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: context.locale == const Locale('ar', 'EG')
            ? Transform.rotate(
                angle: pi,
                child: 'back-arrow'.coloredIcon(),
              )
            : 'back-arrow'.coloredIcon(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
