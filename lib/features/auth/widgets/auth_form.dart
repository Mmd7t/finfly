import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/features/auth/cubit/auth_cubit.dart/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:finfly/config/enums/enums.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/config/routes/app_routes.dart';
import 'package:finfly/core/widgets/global_button.dart';
import 'package:finfly/core/widgets/global_textfield.dart';
import 'package:finfly/features/auth/cubit/auth_type_cubit.dart';
import 'package:finfly/features/auth/widgets/agree_to_policies.dart';
import 'package:finfly/features/auth/widgets/swap_auth_text.dart';
import 'signin_options.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocBuilder<AuthTypeCubit, AuthType>(
      builder: (context, authTypeState) {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              context.loading;
            } else if (state is AuthLoginSuccess) {
              context.loaded;
              context.go(Routes.main);
            } else if (state is AuthSignupSuccess) {
              context.loaded;
              context
                  .read<AuthTypeCubit>()
                  .changeAuthType(AuthType.validateEmail);
            } else if (state is AuthFailed) {
              context.loaded;
              debugPrint(state.message);
            } else if (state is AuthReadyToResetPass) {
              context.loaded;
            }
          },
          builder: (context, state) {
            return Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    if (authTypeState == AuthType.signup) ...{
                      GlobalTextField(
                        hintText: 'First Name'.tr(),
                        prefixIcon: 'person',
                        inputType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your first name'.tr();
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) => cubit.firstName = val,
                      ),
                      GlobalTextField(
                        hintText: 'Last Name'.tr(),
                        prefixIcon: 'person',
                        inputType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your last name';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) => cubit.lastName = val,
                      ),
                    },
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
                    if (authTypeState == AuthType.signup) ...{
                      GlobalTextField(
                        hintText: 'Phone Number'.tr(),
                        prefixIcon: 'phone',
                        inputType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your phone number'.tr();
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) => cubit.phoneNumber = val,
                      ),
                    },
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
                    if (authTypeState == AuthType.signup) ...{
                      GlobalTextField(
                        hintText: 'Confirm Password'.tr(),
                        prefixIcon: 'lock',
                        suffixIcon: 'eye-open',
                        onSuffixTap: () => cubit.changeConfirmPassVisibility(),
                        inputType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.go,
                        obsecure: state.isConfirmPasswordHidden,
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
                      const SizedBox(height: 8),
                      const AgreeToPoliciesTile(),
                    } else ...{
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => context.push(Routes.forget),
                          child: 'Forget password ?!'
                              .tr()
                              .body(context, align: TextAlign.end),
                        ),
                      )
                    },
                    const SizedBox(height: 20),
                    GlobalButton(
                      onTap: () => context.pushReplacement(Routes.main),
                      type: BtnType.withoutIcon,
                      text: (authTypeState == AuthType.signup)
                          ? 'Sign up'.tr()
                          : 'Login'.tr(),
                      width: context.width * 0.6,
                    ),
                    const SizedBox(height: 12),
                    const SwapAuthText(),
                    const SizedBox(height: 15),
                    const SigninOptions(),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
