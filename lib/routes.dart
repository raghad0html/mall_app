import 'package:flutter/material.dart';
import 'package:mall_app/ui/pages/user/register_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'ui/pages/game_detail/game_detail_screen.dart';
import 'ui/pages/home_page/home_page.dart';
import 'ui/pages/qr/invoice_qr.dart';
import 'ui/pages/qr/qr_point_screen.dart';
import 'ui/pages/qr/qr_reader.dart';
import 'ui/pages/splash/splash_screen.dart';
import 'ui/pages/user/login_screen.dart';

class Routes {
  Routes._();

  static const String splashScreen = '/splashScreen';
  static const String homeScreen = '/homeScreen';
  static const String loginScreen = '/loginScreen';
  static const String qrReaderScreen = '/qrReaderScreen';
  static const String gameDetailScreen = '/gameDetailScreen';
  static const String invoiceQrScreen = '/invoiceQrScreen';
  static const String pontQrScreen = '/pointQrScreen';
  static const String scanQrScreen = '/scanQrScreen';
  static const String registerScreen = '/registerScreen';

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
      case registerScreen:
        return PageTransition(
          child: const RegisterScreen(),
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
      case invoiceQrScreen:
        return PageTransition(
          child: InvoiceQrScreen(
            arguments: arguments,
          ),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case scanQrScreen:
        return PageTransition(
          child: const QrReaderScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case pontQrScreen:
        return PageTransition(
          child: PointQRScreen(
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

class InvoiceQrArguments {
  final int mallId;
  final int gameId;
  final String title;
  final bool daily;

  InvoiceQrArguments(
      {required this.mallId,
      required this.gameId,
      required this.title,
      required this.daily});
}
