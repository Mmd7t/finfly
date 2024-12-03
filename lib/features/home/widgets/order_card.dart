import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/image_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/core/models/orders_model.dart';
import 'package:finfly/features/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCard extends StatelessWidget {
  final OrdersModel order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    var themeCubit = context.watch<ThemeCubit>().state;
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.textColor1.withOpacity(0.1),
                  ),
                  child: "laptop.png".assetImage(fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 100,
                child: Center(
                  child: "${order.price}".body(context,
                      color: context.color.primary, weight: FontWeight.bold),
                ),
              ).decorate(
                context,
                elevation: false,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                color: AppColors.textColor1.withOpacity(0.1),
                radius: 5,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              order.status!.name
                  .tr()
                  .toUpperCase()
                  .labelLarge(context,
                      color: (themeCubit is DarkState)
                          ? Colors.white
                          : AppColors.darkCard)
                  .decorate(
                    context,
                    elevation: false,
                    radius: 5,
                    color: AppColors.textColor1.withOpacity(0.1),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  ),
              const SizedBox(height: 8),
              Row(
                children: [
                  "Buyer:".tr().bodySmall(context),
                  " ${order.buyer}".body(
                    context,
                    weight: FontWeight.bold,
                    color: (themeCubit is DarkState)
                        ? Colors.white
                        : AppColors.textColor3,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  "Company:".tr().bodySmall(context),
                  " ${order.company}".body(
                    context,
                    weight: FontWeight.bold,
                    color: (themeCubit is DarkState)
                        ? Colors.white
                        : AppColors.textColor3,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  DateFormat("dd-MM-yyyy")
                      .format(DateTime.parse(order.registered!))
                      .bodySmall(context)
                      .decorate(
                        context,
                        elevation: false,
                        radius: 5,
                        color: AppColors.textColor1.withOpacity(0.1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                      ),
                  const SizedBox(width: 8),
                  (order.isActive! ? "Active".tr() : "Not Active".tr())
                      .toUpperCase()
                      .labelLarge(context,
                          color: order.isActive!
                              ? AppColors.green
                              : context.color.secondary)
                      .decorate(
                        context,
                        elevation: false,
                        radius: 5,
                        color: order.isActive!
                            ? AppColors.green.withOpacity(0.08)
                            : context.color.secondary.withOpacity(0.08),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                      ),
                ],
              ),
            ],
          ),
        ),
      ],
    ).decorate(context, padding: const EdgeInsets.all(8));
  }
}
