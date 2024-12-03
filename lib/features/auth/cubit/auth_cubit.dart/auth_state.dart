part of '../auth_cubit.dart/auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {
  final bool isPasswordHidden;
  final bool isConfirmPasswordHidden;
  final bool checkPolicies;
  const AuthState({
    this.isPasswordHidden = true,
    this.isConfirmPasswordHidden = true,
    this.checkPolicies = false,
  });
}

class AuthInitial extends AuthState {
  const AuthInitial(
      bool isPasswordHidden, bool isConfirmPassHidden, bool checkPolicies)
      : super(
          isPasswordHidden: isPasswordHidden,
          isConfirmPasswordHidden: isConfirmPassHidden,
          checkPolicies: checkPolicies,
        );
  @override
  List<Object?> get props =>
      [isPasswordHidden, isConfirmPasswordHidden, checkPolicies];
}

class AuthLoginSuccess extends AuthState {
  const AuthLoginSuccess();

  @override
  List<Object?> get props =>
      [isPasswordHidden, isConfirmPasswordHidden, checkPolicies];
}

class AuthSignupSuccess extends AuthState {
  const AuthSignupSuccess();

  @override
  List<Object?> get props =>
      [isPasswordHidden, isConfirmPasswordHidden, checkPolicies];
}

class AuthValidateSuccess extends AuthState {
  const AuthValidateSuccess();

  @override
  List<Object?> get props =>
      [isPasswordHidden, isConfirmPasswordHidden, checkPolicies];
}

class AuthResetPassSuccess extends AuthState {
  const AuthResetPassSuccess();

  @override
  List<Object?> get props =>
      [isPasswordHidden, isConfirmPasswordHidden, checkPolicies];
}

class AuthFailed extends AuthState {
  const AuthFailed({required this.statusCode, required this.message});
  final int statusCode;
  final String message;

  @override
  List<Object> get props =>
      [isPasswordHidden, isConfirmPasswordHidden, checkPolicies];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props =>
      [isPasswordHidden, isConfirmPasswordHidden, checkPolicies];
}

class AuthLoaded extends AuthState {
  @override
  List<Object?> get props =>
      [isPasswordHidden, isConfirmPasswordHidden, checkPolicies];
}

class AuthReadyToResetPass extends AuthState {
  const AuthReadyToResetPass();
  @override
  List<Object?> get props =>
      [isPasswordHidden, isConfirmPasswordHidden, checkPolicies];
}
