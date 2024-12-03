part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  final int currentPage;
  const OnboardingState({this.currentPage = 1});

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {
  const OnboardingInitial();
}

class LoadingState extends OnboardingState {
  const LoadingState();
}

class LoadedState extends OnboardingState {
  const LoadedState({super.currentPage});
}
