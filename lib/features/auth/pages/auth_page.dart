import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/enums/enums.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/features/auth/cubit/auth_type_cubit.dart';
import 'package:finfly/features/auth/widgets/auth_form.dart';
import 'package:easy_localization/easy_localization.dart';
import '../widgets/auth_appbar.dart';
import '../widgets/header_section.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AuthAppbar(),
      body: BlocBuilder<AuthTypeCubit, AuthType>(
        builder: (context, authTypeState) {
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (notification) {
              notification.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const HeaderSection(),
                      if (authTypeState == AuthType.login) ...{
                        Positioned(
                          top: 320,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                'Login'.tr().titleMedium(context,
                                    color: AppColors.darkBg),
                                const SizedBox(height: 8),
                                'You can sign in using your email and password'
                                    .tr()
                                    .bodySmall(context),
                              ],
                            ),
                          ),
                        ),
                      } else ...{
                        Positioned(
                          top: 330,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: 'Sign up'
                                .tr()
                                .titleMedium(context, color: AppColors.darkBg),
                          ),
                        ),
                      },
                    ],
                  ),
                  const AuthForm(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
