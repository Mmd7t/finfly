import 'package:finfly/features/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/config/extensions/image_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/core/widgets/fav_button.dart';

class GlobalProductCard extends StatelessWidget {
  const GlobalProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    var themeCubit = context.watch<ThemeCubit>().state;
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Stack(
              children: [
                LayoutBuilder(builder: (context, c) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      color: AppColors.textColor1.withOpacity(0.1),
                    ),
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: "laptop.png".assetImage(
                      width: c.maxWidth,
                      fit: BoxFit.contain,
                    ),
                  );
                }),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        FavButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(top: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "MacBook pro".body(
                  context,
                  color:
                      (themeCubit is DarkState) ? Colors.white : Colors.black,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    "4000\$".labelLarge(
                      context,
                      weight: FontWeight.bold,
                      color: AppColors.orange,
                    ),
                    BlocConsumer<ThemeCubit, ThemeState>(
                      listener: (context, state) => state,
                      builder: (context, state) => InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (state is DarkState)
                                ? AppColors.darkBg
                                : AppColors.textfieldColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: 'add'.iconProvider(
                              context,
                              size: 16,
                              color: (state is DarkState)
                                  ? AppColors.textfieldColor
                                  : AppColors.primaryBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).decorate(context),
    );
  }
}
