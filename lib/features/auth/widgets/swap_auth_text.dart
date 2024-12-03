import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/enums/enums.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/features/auth/cubit/auth_type_cubit.dart';

class SwapAuthText extends StatelessWidget {
  const SwapAuthText({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthTypeCubit>();
    return BlocBuilder<AuthTypeCubit, AuthType>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ((state == AuthType.login)
                  ? "Don't have an account? ".tr()
                  : "Already have an account? ".tr())
              .labelSmall(context),
          GestureDetector(
            onTap: () {
              if (state == AuthType.login) {
                bloc.changeAuthType(AuthType.signup);
              } else {
                bloc.changeAuthType(AuthType.login);
              }
            },
            child: ((state == AuthType.login) ? "Sign up".tr() : "Sign in".tr())
                .labelSmall(
              context,
              color: AppColors.orange,
              decoration: TextDecoration.underline,
              weight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
