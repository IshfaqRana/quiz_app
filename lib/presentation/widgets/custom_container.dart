import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
    this.radius,
    this.border,
  }) : super(key: key);
  final double height;
  final double width;
  final Widget child;
  final double? radius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.kBGWhite,
        border: border ?? Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(radius ?? 0.5.h),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.05),
            blurRadius: 0.5.h,
            spreadRadius: 0.2.h,
            offset: Offset(0.8.h, 0.8.h),
          ),
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.05),
            blurRadius: 1.0.h,
            spreadRadius: 0.1.h,
            offset: Offset(-0.8.h, -0.8.h),
          ),
        ],
      ),
      child: child,
    );
  }
}
