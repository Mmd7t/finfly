import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/features/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finfly/config/enums/enums.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/core/widgets/global_appbar.dart';
import 'package:finfly/core/widgets/global_button.dart';
import 'package:finfly/features/settings/widgets/language_dialog.dart';
import '../widgets/setting_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: 'Settings'.tr()),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: 'General Settings'
                  .tr()
                  .titleMedium(context, centerText: false),
            ),
            const SizedBox(height: 12),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) => SettingTile(
                title: 'Dark Mode'.tr(),
                isSwitchTile: true,
                switchValue: state is DarkState ? true : false,
                onChanged: (value) {
                  BlocProvider.of<ThemeCubit>(context).switchMode(value!);
                },
              ),
            ),
            const SizedBox(height: 8),
            SettingTile(
              title: 'Language'.tr(),
              isLanguageTile: true,
              onTap: () => showDialog(
                context: context,
                builder: (context) => const LanguageDialog(),
              ),
            ),
            const SizedBox(height: 15),
            GlobalButton(
              onTap: () {},
              type: BtnType.withIcon,
              text: 'Log out'.tr(),
              icon: 'logout',
              color: context.color.secondary,
              width: context.width * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
