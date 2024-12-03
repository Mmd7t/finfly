//NOTE ==> Custom Text Styles Extension
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:finfly/config/constants/app_colors.dart';

extension CustomTextStyles on String {
  Text headlineSmall(BuildContext context) => Text(
        this,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontFamily: context.locale == const Locale('ar', 'EG')
                  ? 'Almarai'
                  : 'Poppin',
            ),
        textAlign: TextAlign.center,
      );

  Text titleLarge(BuildContext context, {Color? color}) => Text(
        this,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: color ?? Theme.of(context).primaryColor,
              fontWeight: FontWeight.w700,
              fontFamily: context.locale == const Locale('ar', 'EG')
                  ? 'Almarai'
                  : 'Poppin',
            ),
        textAlign: TextAlign.center,
      );
  Text titleMedium(BuildContext context,
          {Color? color, bool centerText = true}) =>
      Text(
        this,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: color ?? Theme.of(context).primaryColor,
              fontWeight: FontWeight.w700,
              fontFamily: context.locale == const Locale('ar', 'EG')
                  ? 'Almarai'
                  : 'Poppin',
            ),
        textAlign: (centerText) ? TextAlign.center : TextAlign.start,
      );

  Text titleSmall(BuildContext context,
          {Color? color, int? maxLines, TextOverflow? overflow}) =>
      Text(
        this,
        maxLines: maxLines,
        overflow: overflow,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: color ?? Theme.of(context).primaryColor,
              fontFamily: context.locale == const Locale('ar', 'EG')
                  ? 'Almarai'
                  : 'Poppin',
            ),
      );

  Text labelLarge(BuildContext context, {Color? color, FontWeight? weight}) =>
      Text(
        this,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: color ?? Theme.of(context).primaryColor,
              fontFamily: context.locale == const Locale('ar', 'EG')
                  ? 'Almarai'
                  : 'Poppin',
              fontWeight:
                  weight ?? Theme.of(context).textTheme.labelLarge!.fontWeight,
            ),
      );

  Text body(
    BuildContext context, {
    Color? color,
    TextAlign? align,
    TextDecoration decoration = TextDecoration.none,
    FontWeight? weight,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: color ?? AppColors.textColor2,
              decoration: decoration,
              fontFamily: context.locale == const Locale('ar', 'EG')
                  ? 'Almarai'
                  : 'Poppin',
              fontWeight:
                  weight ?? Theme.of(context).textTheme.bodyMedium!.fontWeight,
            ),
        softWrap: true,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: align ?? TextAlign.start,
      );
  Text bodySmall(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    TextAlign align = TextAlign.start,
  }) =>
      Text(
        this,
        textAlign: align,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: color ?? AppColors.textColor2,
              fontWeight: weight ?? FontWeight.normal,
              fontFamily: context.locale == const Locale('ar', 'EG')
                  ? 'Almarai'
                  : 'Poppin',
            ),
      );
  Text labelSmall(
    BuildContext context, {
    Color? color,
    int? maxLines,
    FontWeight weight = FontWeight.normal,
    TextDecoration decoration = TextDecoration.none,
    TextAlign align = TextAlign.start,
  }) =>
      Text(
        this,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: color ?? AppColors.textColor1,
              fontWeight: weight,
              decoration: decoration,
              fontFamily: context.locale == const Locale('ar', 'EG')
                  ? 'Almarai'
                  : 'Poppin',
            ),
        textAlign: align,
        softWrap: true,
        maxLines: maxLines,
        // overflow: TextOverflow.ellipsis,
      );

  Text tiny(BuildContext context,
          {Color? color, FontWeight? weight, TextAlign? align}) =>
      Text(
        this,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 10,
              color: color ?? AppColors.textColor1,
              fontWeight: weight ?? FontWeight.normal,
              fontFamily: context.locale == const Locale('ar', 'EG')
                  ? 'Almarai'
                  : 'Poppin',
            ),
        textAlign: align ?? TextAlign.start,
      );
  Text veryTiny(BuildContext context, {Color? color}) => Text(
        this,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 8,
              color: color ?? Colors.white,
              fontFamily: context.locale == const Locale('ar', 'EG')
                  ? 'Almarai'
                  : 'Poppin',
            ),
      );
}
