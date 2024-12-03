part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  final bool isFirstTime;
  const SplashState({this.isFirstTime = true});

  @override
  List<Object> get props => [isFirstTime];
}

class SplashInitial extends SplashState {
  const SplashInitial(bool isFirstTime) : super(isFirstTime: isFirstTime);
}

class SplashLoading extends SplashState {
  const SplashLoading();
}

class SplashLoaded extends SplashState {
  const SplashLoaded();
}
