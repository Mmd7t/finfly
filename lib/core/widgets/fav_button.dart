import 'package:flutter/material.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {},
      child: 'heart-stroke'.iconProvider(context, color: AppColors.textColor1),
    );
  }
}
