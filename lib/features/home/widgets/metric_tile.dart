import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/features/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MetricTile extends StatelessWidget {
  final String title;
  final String value;

  const MetricTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    var themeState = context.watch<ThemeCubit>().state;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        value.titleLarge(context,
            color: (themeState is DarkState) ? Colors.white : Colors.black),
        const SizedBox(height: 8),
        title.body(context),
      ],
    );
  }
}
