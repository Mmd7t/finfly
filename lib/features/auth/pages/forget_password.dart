import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/features/auth/cubit/auth_cubit.dart/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/config/enums/enums.dart';
import '../../../core/widgets/global_button.dart';
import '../../../core/widgets/global_textfield.dart';
import '../widgets/auth_appbar.dart';
import '../widgets/header_section.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Scaffold(
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
                          'Forget Password'
                              .tr()
                              .titleMedium(context, color: AppColors.darkBg),
                          const SizedBox(height: 8),
                          'Enter your email to send a verification code'
                              .tr()
                              .body(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Form(
                key: cubit.forgetPassFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      GlobalTextField(
                        hintText: 'Email Address'.tr(),
                        prefixIcon: 'email',
                        inputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your email'.tr();
                          } else if (!val.contains('@')) {
                            return 'Please enter valid email'.tr();
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) => cubit.email = val,
                      ),
                      const SizedBox(height: 20),
                      GlobalButton(
                        onTap: () {},
                        type: BtnType.withoutIcon,
                        text: 'Send'.tr(),
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
    );
  }
}
