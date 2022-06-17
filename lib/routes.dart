import 'package:flutter/material.dart';
import 'package:mall_app/main_sdk/apis/user/models/user_model.dart';
import 'package:mall_app/ui/pages/about_page/about_page.dart';
import 'package:mall_app/ui/pages/gift_for_shop_page/gifts_for_all_shop_screen.dart';
import 'package:mall_app/ui/pages/gift_for_shop_page/gifts_for_shop_screen.dart';
import 'package:mall_app/ui/pages/mall_page/mall_page.dart';
import 'package:mall_app/ui/pages/user/forget_password.dart';
import 'package:mall_app/ui/pages/user/profile_page.dart';
import 'package:mall_app/ui/pages/user/register_screen.dart';
import 'package:mall_app/ui/pages/user/reset_password_screen.dart';
import 'package:mall_app/ui/pages/user/update_profile_page.dart';
import 'package:page_transition/page_transition.dart';

import 'ui/pages/all_games/all_games.dart';
import 'ui/pages/game_detail/game_detail_screen.dart';
import 'ui/pages/home_page/contact_info_screen.dart';
import 'ui/pages/home_page/home_page.dart';
import 'ui/pages/notifications/notification_screen.dart';
import 'ui/pages/qr/invoice_qr.dart';
import 'ui/pages/qr/qr_point_screen.dart';
import 'ui/pages/qr/qr_reader.dart';
import 'ui/pages/share_shop_page/share_shop_page.dart';
import 'ui/pages/shop_details_page/shop_details_page.dart';
import 'ui/pages/shop_page/shop_page.dart';
import 'ui/pages/splash/splash_screen.dart';
import 'ui/pages/user/check_code_screen.dart';
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
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String allGamesScreen = '/allGamesScreen';
  static const String checkCodeScreen = '/checkCodeScreen';
  static const String mallsScreen = '/mallsScreen';
  static const String shopsScreen = '/shopsScreen';
  static const String shareShopsScreen = '/shareShopsScreen';
  static const String shopDetailsScreen = '/shopDetailsScreen';
  static const String profileScreen = '/profileScreen';
  static const String updateProfileScreen = '/updateProfileScreen';
  static const String aboutScreen = '/aboutScreen';
  static const String giftsForShopScreen = '/giftsForShopScreen';
  static const String giftsAllForShopScreen = '/giftsAllForShopScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String contactInfoScreen = '/contactInfoScreen';

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
          child: LoginScreen(
            arguments: arguments,
          ),
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

      case forgetPasswordScreen:
        return PageTransition(
          child: const ForgetPassword(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case resetPasswordScreen:
        return PageTransition(
          child: ResetPasswordScreen(
            arguments: arguments,
          ),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case allGamesScreen:
        return PageTransition(
          child: const AllGamesScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case checkCodeScreen:
        return PageTransition(
          child: CheckCodeScreen(
            arguments: arguments,
          ),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case mallsScreen:
        int args = settings.arguments;
        return PageTransition(
          child: MallsPage(city: args),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case shopsScreen:
        ShopArguments args = settings.arguments;
        return PageTransition(
          child: ShopsPage(shopArguments: args),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case shareShopsScreen:
        ShopArguments args = settings.arguments;
        return PageTransition(
          child: ShareShopsPage(shopArguments: args),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case shopDetailsScreen:
        ShopArguments args = settings.arguments;
        return PageTransition(
          child: ShopDetailsPage(shopArguments: args),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case profileScreen:
        return PageTransition(
          child: const ProfilePage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case updateProfileScreen:
        final UserArgs args = settings.arguments;
        return PageTransition(
          child: UpdateProfilePage(
              userModel: args.userModel, onChanged: args.onChanges),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case aboutScreen:
        return PageTransition(
          child: const AboutPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case giftsForShopScreen:
        return PageTransition(
          child: GiftsForShopScreen(
            arguments: arguments,
          ),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case giftsAllForShopScreen:
        return PageTransition(
          child: GiftsForAllShopScreen(
          ),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case notificationScreen:
        return PageTransition(
          child: NotificationScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );

      case contactInfoScreen:
        return PageTransition(
          child: ContactInfoScreen(),
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

class UserArgs {
  final UserModel userModel;
  final Function(UserModel) onChanges;

  UserArgs({required this.userModel, required this.onChanges});
}

class ShopArguments {
  final String mallName;
  final int mallId;
  final String? image;

  ShopArguments({required this.mallName, required this.mallId, this.image});
}

class InvoiceQrArguments {
  final int mallId;
  final int gameId;
  final String title;
  final bool daily;
  final int targetPoints;
  final int balancePoints;
  final String? mallName;
  final String? billAmount;
  final String? currency;

  InvoiceQrArguments({
    required this.mallId,
    required this.gameId,
    required this.title,
    required this.daily,
    required this.billAmount,
    required this.currency,
    this.mallName,
    this.balancePoints = 0,
    this.targetPoints = 0,
  });
}

class StringArguments {
  final String email;
  final String? code;

  StringArguments({
    required this.email,
    this.code,
  });
}

class BoolArguments {
  final bool fromLogout;

  BoolArguments({
    required this.fromLogout,
  });
}
