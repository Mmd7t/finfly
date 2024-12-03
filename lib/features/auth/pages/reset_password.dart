import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/features/auth/cubit/auth_cubit.dart/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/config/enums/enums.dart';
import '../../../core/widgets/global_button.dart';
import '../../../core/widgets/global_textfield.dart';
import '../widgets/auth_appbar.dart';
import '../widgets/header_section.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocSelector<AuthCubit, AuthState, AuthState>(
      selector: (state) => state,
      builder: (context, state) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const AuthAppbar(),
        body: NotificationListener<OverscrollIndicatorNotification>(
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
                    Positioned(
                      top: 320,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            'Reset Password'
                                .tr()
                                .titleMedium(context, color: AppColors.darkBg),
                            const SizedBox(height: 8),
                            'Enter your new password and confirm it'
                                .tr()
                                .body(context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Form(
                  key: cubit.resetPassFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        GlobalTextField(
                          controller: cubit.passController,
                          hintText: 'Password'.tr(),
                          prefixIcon: 'lock',
                          suffixIcon: 'eye-open',
                          obsecure: state.isPasswordHidden,
                          onSuffixTap: () => cubit.changePassVisibility(),
                          textInputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r"\s")),
                          ],
                          inputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please enter your password'.tr();
                            } else if (val.length < 6) {
                              return 'Password must be at least 6 digits'.tr();
                            } else {
                              return null;
                            }
                          },
                          onSaved: (val) => cubit.password = val,
                        ),
                        const SizedBox(height: 8),
                        GlobalTextField(
                          hintText: 'Confirm Password'.tr(),
                          prefixIcon: 'lock',
                          suffixIcon: 'eye-open',
                          onSuffixTap: () {},
                          inputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.go,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please confirm your password'.tr();
                            } else if (val != cubit.passController.text) {
                              return 'Password does not match'.tr();
                            } else {
                              return null;
                            }
                          },
                          onSaved: (val) => cubit.confirmPassword = val,
                        ),
                        const SizedBox(height: 20),
                        GlobalButton(
                          onTap: () {},
                          type: BtnType.withoutIcon,
                          text: 'Reset'.tr(),
                          width: context.width * 0.6,
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
