import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';

import '../widget/circular_loading_widget.dart';

class Helper {
  BuildContext? context;

  Helper.of(BuildContext _context) {
    context = _context;
  }

  static OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        height: size.height,
        width: size.width,
        top: 0,
        left: 0,
        child: Material(
          color: AppColors.blackLightColor.withOpacity(0.75),
          child: const CircularLoadingWidget(
            height: 200,
          ),
        ),
      );
    });
    return loader;
  }

  static hideLoader(OverlayEntry loader) {
    Timer(const Duration(milliseconds: 500), () {
      try {
        loader.remove();
      } catch (e) {
        log('error: $e');
      }
    });
  }
}
