import 'package:flutter/material.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';

class GlobalAppLogo extends StatelessWidget {
  final double? width;
  const GlobalAppLogo({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'app logo',
      child: 'logo'.icon(width: width),
    );
  }
}
