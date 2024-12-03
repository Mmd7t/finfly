//NOTE ==> Custom Icon Provider Extension
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/features/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart' hide Svg;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:finfly/config/constants/app_variables.dart';
import 'package:finfly/config/extensions/extensions.dart';

//NOTE ==> Custom MediaQuery Extension
extension DarkIconsChanging on String {
  BlocBuilder coloredIcon(
          {double? width, bool isBrand = false, bool isIllustration = false}) =>
      BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) => (state is LightState)
            ? icon(
                width: width, isBrand: isBrand, isIllustration: isIllustration)
            : '$this-dark'.icon(
                width: width, isBrand: isBrand, isIllustration: isIllustration),
      );
}

extension CustomIcon on String {
  Widget iconProvider(BuildContext context, {Color? color, double? size}) =>
      ImageIcon(
        Svg('${AppVariables.iconsPath}$this.svg'),
        color: color ?? context.color.primary,
        size: size ?? 24,
      );
  Widget icon(
          {double? width,
          bool isBrand = false,
          bool isIllustration = false,
          ColorFilter? colorFilter}) =>
      SvgPicture.asset(
        (isBrand)
            ? '${AppVariables.logosPath}$this.svg'
            : (isIllustration)
                ? '${AppVariables.illustrationsPath}$this.svg'
                : '${AppVariables.iconsPath}$this.svg',
        width: width,
        colorFilter:
            colorFilter ?? const ColorFilter.mode(Colors.white, BlendMode.dst),
      );
}

extension TranslatedIcon on String {
  Widget trIcon(BuildContext context,
          {double? width,
          bool isBrand = false,
          bool isIllustration = false,
          ColorFilter? colorFilter}) =>
      (context.locale == const Locale('ar', 'EG'))
          ? Transform.rotate(
              angle: pi,
              child: icon(
                width: width,
                isBrand: isBrand,
                isIllustration: isIllustration,
                colorFilter: colorFilter,
              ),
            )
          : icon(
              width: width,
              isBrand: isBrand,
              isIllustration: isIllustration,
              colorFilter: colorFilter,
            );
  Widget trIconProvider(BuildContext context, {Color? color, double? size}) =>
      (context.locale == const Locale('ar', 'EG'))
          ? Transform.rotate(
              angle: pi,
              child: iconProvider(context, color: color, size: size),
            )
          : iconProvider(context, color: color, size: size);

  Widget trColoredIcon(BuildContext context,
          {double? width, bool isBrand = false, bool isIllustration = false}) =>
      (context.locale == const Locale('ar', 'EG'))
          ? Transform.rotate(
              angle: pi,
              child: coloredIcon(),
            )
          : coloredIcon();
}
