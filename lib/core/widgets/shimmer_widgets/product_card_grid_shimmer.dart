import 'package:flutter/material.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/extensions.dart';

class ProductCardGridShimmer extends StatelessWidget {
  const ProductCardGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                color: AppColors.textColor1,
              ),
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
            ).shimmer,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(top: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: c.maxWidth * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ).shimmer,
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: c.maxWidth * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ).shimmer,
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                    ).shimmer,
                  ],
                ),
              ],
            ),
          ),
        ],
      ).decorate(context);
    });
  }
}
