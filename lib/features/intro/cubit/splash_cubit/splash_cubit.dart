import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial(true));

  startSplashTimeout() async {
    emit(const SplashLoading());
    await Future.delayed(const Duration(seconds: 3));
    emit(const SplashLoaded());
  }
}
