import 'package:finfly/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/core/widgets/global_app_logo.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () => context.push(Routes.settings),
          icon: 'settings'.coloredIcon(),
        ),
      ],
      flexibleSpace: const SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GlobalAppLogo(),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight + 5);
}
