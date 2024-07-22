

import 'package:flutter/material.dart';
import 'package:medical_app/core/config/colors.dart';

class SwapperCircleIndicator<T> extends StatelessWidget {
  final List<T> items;
  final int currentIndex;
  final bool indicatorInTheCenter;
  SwapperCircleIndicator({
    required this.items,
    required this.currentIndex,
    required this.indicatorInTheCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment:
              indicatorInTheCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Transform.translate(
              offset: Offset(0, 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 32,
                  color: Colors.white12,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (contex, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              _CircleSwipperIndicator(isEqualCurrentIndex: currentIndex == index));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CircleSwipperIndicator extends StatelessWidget {
  final bool isEqualCurrentIndex;
  const _CircleSwipperIndicator({required this.isEqualCurrentIndex});

  @override
  Widget build(BuildContext context) {
    if (!isEqualCurrentIndex) {
      return CircleAvatar(
        maxRadius: 5,
        minRadius: 1,
        backgroundColor: AppColors.natural.shade500,
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(120),
      child: Container(
        color: AppColors.primary.shade100,
        width: 17,
        height: 13,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Container(
              color: AppColors.primary.shade300,
            ),
          ),
        ),
      ),
    );
  }
}
