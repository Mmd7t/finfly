part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class LightState extends ThemeState {
  const LightState();
}

class DarkState extends ThemeState {
  const DarkState();
}
