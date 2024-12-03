import 'package:equatable/equatable.dart';
import 'package:finfly/config/constants/shared_prefs_keys.dart';
import 'package:finfly/core/database/shared_prefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const LightState());

  getThemeMode() {
    final isDark = SharedPrefsHelper.getBool(SharedPrefsKeys.theme);
    if (isDark) {
      emit(const DarkState());
    } else {
      emit(const LightState());
    }
  }

  switchMode(bool isDark) {
    if (isDark) {
      emit(const DarkState());
    } else {
      emit(const LightState());
    }
    SharedPrefsHelper.save(SharedPrefsKeys.theme, isDark);
  }
}
