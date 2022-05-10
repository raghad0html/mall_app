
import 'package:flutter/material.dart';
import 'package:mall_app/ui/shared/widget/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child: ShimmerWidget(
         // child:Image.asset(Assets.appLogoIcon1 ,)
          child:SizedBox(width: 50,height: 50,)
        ),
      ),
    );
  }
}
