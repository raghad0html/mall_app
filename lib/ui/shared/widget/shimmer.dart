import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final bool enabled;

  final Widget child;

  const ShimmerWidget({Key? key,required this.child, this.enabled = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.btt,
      baseColor: AppColors.primaryColor,
      highlightColor: Colors.green,
      enabled: enabled,
      child: child,
     loop: 5,
    );
  }
}
