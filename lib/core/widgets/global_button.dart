import 'package:flutter/material.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/config/enums/enums.dart';

class GlobalButton extends StatelessWidget {
  final BtnType type;
  final double? width, height;
  final String? icon;
  final String text;
  final Color? color;
  final Color? textColor;
  final Color? splashColor;
  final VoidCallback onTap;
  final bool elevation;
  const GlobalButton({
    super.key,
    required this.onTap,
    this.icon,
    required this.text,
    this.color,
    this.splashColor,
    this.textColor,
    required this.type,
    this.height,
    this.width,
    this.elevation = true,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: height ?? 60,
      onPressed: onTap,
      elevation: 0.0,
      splashColor: splashColor ?? context.color.primary.withOpacity(0.4),
      highlightElevation: 0.0,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: color ?? context.color.primary,
      child: (type == BtnType.withIcon)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                text.titleSmall(context, color: Colors.white),
                const SizedBox(width: 10),
                icon!.iconProvider(context, color: Colors.white),
              ],
            )
          : text.titleSmall(context, color: textColor ?? Colors.white),
    ).decorate(context, elevation: elevation);
  }
}
