import 'package:easy_localization/easy_localization.dart';
import 'package:finfly/config/constants/app_colors.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/config/extensions/text_extensions.dart';
import 'package:finfly/config/routes/app_routes.dart';
import 'package:finfly/core/widgets/global_product_card.dart';
import 'package:finfly/core/widgets/shimmer_widgets/product_card_grid_shimmer.dart';
import 'package:finfly/features/home/widgets/home_appbar.dart';
import 'package:finfly/features/settings/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeCubit = context.watch<ThemeCubit>().state;
    final ValueNotifier<bool> isLoaded = useState(false);
    useEffect(() {
      Future.delayed(
        const Duration(seconds: 3),
        () async {
          isLoaded.value = true;
        },
      );
      return null;
    }, []);
    return Scaffold(
      appBar: const HomeAppBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10)
            .copyWith(bottom: kBottomNavigationBarHeight + 25),
        clipBehavior: Clip.none,
        itemCount: 15,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 9 / 12,
          mainAxisExtent: 235,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => (!isLoaded.value)
            ? const ProductCardGridShimmer()
            : const GlobalProductCard(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.orange,
        onPressed: () => context.push(Routes.orders),
        label: "Orders".tr().titleSmall(context,
            color:
                (themeCubit is DarkState) ? AppColors.darkCard : Colors.white),
        icon: "orders".iconProvider(context,
            color:
                (themeCubit is DarkState) ? AppColors.darkCard : Colors.white),
        heroTag: "orderstag",
        shape: const StadiumBorder(),
        extendedPadding: const EdgeInsets.symmetric(horizontal: 30),
      ),
    );
  }
}
