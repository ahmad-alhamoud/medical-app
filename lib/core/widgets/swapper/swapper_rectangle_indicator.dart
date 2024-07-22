
import 'package:flutter/material.dart';
import 'package:medical_app/core/config/colors.dart';

class SwapperRectablgeIndicator<T> extends StatelessWidget {
  final List<T> items;
  final int currentIndex;
  final bool indicatorInTheCenter;
  SwapperRectablgeIndicator({
    required this.items,
    required this.currentIndex,
    required this.indicatorInTheCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment:
                  indicatorInTheCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 24,
                    color: Colors.white12,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (contex, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _SwipperRectablgeIndicator(
                                isEqualCurrentIndex: currentIndex == index));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SwipperRectablgeIndicator extends StatelessWidget {
  final bool isEqualCurrentIndex;
  const _SwipperRectablgeIndicator({required this.isEqualCurrentIndex});

  @override
  Widget build(BuildContext context) {
    if (isEqualCurrentIndex) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          color: AppColors.primary,
          width: 24,
          height: 2,
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(120),
      child: Container(
        color: AppColors.primary.withOpacity(0.3),
        width: 8,
        height: 8,
      ),
    );
  }
}
