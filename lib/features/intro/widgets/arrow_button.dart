import 'package:flutter/material.dart';
import 'package:finfly/config/extensions/extensions.dart';
import 'package:finfly/config/extensions/icons_extensions.dart';
import 'package:finfly/config/extensions/responsive_extensions.dart';

import 'circular_pagination_painter.dart';

class ArrowButton extends StatelessWidget {
  final int currentPage;
  final VoidCallback onPressed;
  final double animation;
  final AnimationController controller;
  const ArrowButton({
    super.key,
    required this.currentPage,
    required this.onPressed,
    required this.animation,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: context.width,
      child: Column(
        children: [
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) => CustomPaint(
              painter: CirclePaginationPainter(animation),
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.color.primary,
                ),
                child: IconButton(
                  icon: 'arrow'.iconProvider(
                    context,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: onPressed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
