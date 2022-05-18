import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall_app/constants/app_theme.dart';

import '../../main_sdk/apis/game/models/game_level_enums_model.dart';
import '../widget/circular_loading_widget.dart';

class Helper {
  BuildContext? context;
  DateTime? currentBackPressTime;
  bool back = false;
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

  static String getGameLevelFromEnum(GameLevelEnumsModel level) {
    print(' level level level level level $level');

    switch (level) {
      case GameLevelEnumsModel.zero:
        return 'المرحلة اليومية';
      case GameLevelEnumsModel.dailyDone:
        return 'تم إنهاء المرحلة اليومية';
      case GameLevelEnumsModel.dailyProgress:
        return 'المرحلة اليومية جمع النقاط';
      case GameLevelEnumsModel.weeklyDone:
        return 'تم إنهاء المرحلة الاسبوعية';
      case GameLevelEnumsModel.monthlyDone:
        return 'تم إنهاء المرحلة الشهرية';
      case GameLevelEnumsModel.quarterlyDone:
        return 'تم إنهاء المرحلة الربع سنوية';
      case GameLevelEnumsModel.errorDetectLevel:
      default:
        return '';
    }
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    print(back);

    if (!back) {
      // if ( now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      //   currentBackPressTime = now;
      back = true;
      print(currentBackPressTime);
      Fluttertoast.showToast(msg: 'اضغط مرة ثانية للمغادرة');
      return Future.value(false);
      // }
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    back = false;
    return Future.value(true);
  }
}
