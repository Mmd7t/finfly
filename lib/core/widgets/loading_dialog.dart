import 'package:flutter/material.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:finfly/config/extensions/text_extensions.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Dialog(
        insetAnimationCurve: Curves.easeInOutBack,
        alignment: Alignment.center,
        insetAnimationDuration: const Duration(milliseconds: 1800),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            'Loading'.labelLarge(context),
            Lottie.asset('assets/lotties/loading.json', width: 100),
          ],
        ),
      ).decorate(context),
    );
  }
}
