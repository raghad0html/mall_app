import 'package:flutter/material.dart';
import 'package:mall_app/ui/pages/home_page/home_page.dart';
import 'package:mall_app/ui/pages/login/login_screen.dart';
import 'package:mall_app/ui/qr_reader.dart';
import 'package:page_transition/page_transition.dart';

import 'ui/pages/game_detail/game_detail_screen.dart';
import 'ui/pages/splash/splash_screen.dart';

class Routes {
  Routes._();

  static const String splashScreen = '/splashScreen';
  static const String homeScreen = '/homeScreen';
  static const String loginScreen = '/loginScreen';
  static const String qrReaderScreen = '/qrReaderScreen';
  static const String gameDetailScreen = '/gameDetailScreen';

  static Route? getRoutes(settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case splashScreen:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case homeScreen:
        return PageTransition(
          child: const HomePage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case loginScreen:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case qrReaderScreen:
        return PageTransition(
          child: const QrReaderScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );

      case gameDetailScreen:
        return PageTransition(
          child: GameDetailScreen(
            arguments: arguments,
          ),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      default:
        return null;
    }
  }
}

class GameDetails {
  final String mallName;
  final int mallId;
  final int gameId;

  GameDetails(
      {required this.mallName, required this.mallId, required this.gameId});
}
