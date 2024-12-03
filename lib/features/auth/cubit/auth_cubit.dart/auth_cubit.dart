import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part './auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial(true, true, false));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPassFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgetPassFormKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();

  String? firstName,
      lastName,
      phoneNumber,
      email,
      password,
      confirmPassword,
      otp;

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  bool agreeToPoliciesCheck = false;

  changePassVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(AuthInitial(
        isPasswordHidden, isConfirmPasswordHidden, agreeToPoliciesCheck));
  }

  changeConfirmPassVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    emit(AuthInitial(
        isPasswordHidden, isConfirmPasswordHidden, agreeToPoliciesCheck));
  }
}
