import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingInitial());

  final PageController pageController = PageController(initialPage: 0);
  final onboardingList = [
    OnboardingItem(
        'onboarding1', 'From Sea to Sky. we\'re going too high.'.tr()),
    OnboardingItem('onboarding2',
        'The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs.'),
    OnboardingItem('onboarding3',
        'The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs.'),
    OnboardingItem('logo',
        'The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced by fox whelps. Bawds jog, flick quartz, vex nymphs.'),
  ];

  nextTo() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  backTo() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  goToLastPage() {
    pageController.animateToPage(3,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }
}

class OnboardingItem {
  final String img;
  final String body;

  OnboardingItem(this.img, this.body);
}
