import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/features/auth/cubit/auth_cubit.dart/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/features/auth/cubit/auth_type_cubit.dart';
import 'package:finfly/config/enums/enums.dart';
import '../../../core/widgets/global_button.dart';
import '../widgets/auth_appbar.dart';
import '../widgets/header_section.dart';

class OtpCodePage extends StatelessWidget {
  const OtpCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
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
                      Positioned(
                        top: 320,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              'Otp Code'.tr().titleMedium(context,
                                  color: AppColors.darkBg),
                              const SizedBox(height: 8),
                              '''${'We have sent code to your email'.tr()}
      mm***********3@gmail.com'''
                                  .labelSmall(context),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: cubit.otpFormKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          const SizedBox(height: 25),
                          Pinput(
                            onCompleted: (value) => cubit.otp = value,
                            onSubmitted: (value) => cubit.otp = value,
                            length: 5,
                            submittedPinTheme: PinTheme(
                              height: 65,
                              width: 65,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColors.textfieldColor),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                color: context.color.primary,
                              ),
                            ),
                            errorPinTheme: PinTheme(
                              height: 65,
                              width: 65,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColors.textfieldColor),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: AppColors.red,
                              ),
                            ),
                            defaultPinTheme: PinTheme(
                              height: 65,
                              width: 65,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: context.color.primary),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: AppColors.textfieldColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          'Send OTP again'.tr().bodySmall(
                                context,
                                color: AppColors.orange,
                                weight: FontWeight.bold,
                              ),
                          const SizedBox(height: 25),
                          GlobalButton(
                            onTap: () {},
                            type: BtnType.withoutIcon,
                            text: 'Verify'.tr(),
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
          );
        },
      ),
    );
  }
}
