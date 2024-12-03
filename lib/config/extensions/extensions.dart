import 'package:finfly/features/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/widgets/loading_dialog.dart';

//NOTE ==> Custom Theme Extension
extension ThemeValues on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

//NOTE ==> Loading Dialog Extension
extension LoadingDialogExtension on BuildContext {
  void get loading => showDialog(
        context: this,
        barrierDismissible: false,
        barrierLabel: 'loader',
        builder: (context) => const LoadingDialog(),
      );
  void get loaded => Navigator.of(this).pop();
}

//NOTE ==> Custom Box Decoration Extension
extension CustomBoxDecoration on Widget {
  Widget decorate(
    BuildContext context, {
    Color? color,
    double? radius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    bool elevation = true,
  }) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) => AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        margin: margin,
        padding: padding,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: color ??
              ((state is LightState)
                  ? Colors.white
                  : (state is DarkState)
                      ? AppColors.darkCard
                      : Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 15)),
          boxShadow: [
            if (elevation)
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: this,
      ),
    );
  }

  Widget get shimmer => BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) => Shimmer.fromColors(
          period: const Duration(milliseconds: 1000),
          highlightColor: AppColors.bg,
          baseColor: AppColors.textfieldColor.withOpacity(0.8),
          child: this,
        ),
      );

  Widget dialogTransition(Animation<double> animation) {
    Tween<Offset> tween;
    if (animation.status == AnimationStatus.reverse) {
      tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
    } else {
      tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
    }

    return SlideTransition(
      position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOutBack)),
      child: this,
    );
  }
}
