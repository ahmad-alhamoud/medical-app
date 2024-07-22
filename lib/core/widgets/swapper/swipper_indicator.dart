

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/config/colors.dart';

class SwipperIndicator extends StatelessWidget {
  final bool isEqualCurrentIndex;
  const SwipperIndicator({required this.isEqualCurrentIndex});

  @override
  Widget build(BuildContext context) {
    if (isEqualCurrentIndex) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          color: AppColors.natural.shade50,
          width: 16,
          height: 2.h,
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(120),
      child: Container(
        color: AppColors.primary.shade300,
        width: 8,
        height: 4,
      ),
    );
  }
}
