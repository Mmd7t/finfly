import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/enums/enums.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/config/routes/app_routes.dart';
import 'package:finfly/core/widgets/global_app_logo.dart';
import 'package:finfly/features/auth/cubit/auth_type_cubit.dart';
import '../../../../core/widgets/global_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Row(
            children: [
              TextButton.icon(
                style: ButtonStyle(
                  overlayColor: WidgetStateColor.resolveWith(
                      (states) => Colors.transparent),
                ),
                onPressed: () => context.pop(),
                icon: Transform.rotate(
                  angle: pi,
                  child: 'arrow'.icon(),
                ),
                label: 'Back'
                    .tr()
                    .labelLarge(context, color: AppColors.textColor1),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlobalAppLogo(width: context.width * 0.7),
                  const SizedBox(height: 15),
                  "FinFLY".titleLarge(context),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlobalButton(
                    type: BtnType.withoutIcon,
                    text: 'Login'.tr(),
                    width: context.width * 0.65,
                    onTap: () {
                      context
                          .read<AuthTypeCubit>()
                          .changeAuthType(AuthType.login);
                      context.push(Routes.auth);
                    },
                  ),
                  const SizedBox(height: 12),
                  GlobalButton(
                    type: BtnType.withoutIcon,
                    text: 'Sign up'.tr(),
                    width: context.width * 0.65,
                    onTap: () {
                      context
                          .read<AuthTypeCubit>()
                          .changeAuthType(AuthType.signup);
                      context.push(Routes.auth);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
