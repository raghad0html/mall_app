import 'package:flutter/material.dart';
import 'package:mall_app/ui/pages/home_page/home_page.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  Routes._();

  static const String home = '/home';



  static Route? getRoutes(settings) {
    switch (settings.name) {
      case home:
        return PageTransition(
          child: const HomePage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      default:
        return null;
    }
  }
}

class NumberUser {
  final String countryCodeWithPlus;
  final String phoneNumber;

  NumberUser({required this.countryCodeWithPlus, required this.phoneNumber});
}


class ItemFilter {
  final String? categoryObjectId;
  final String? brandObjectId;
  final String? nameOfBrandOrCategory;
  bool isOffer;
  ItemFilter(
      {this.categoryObjectId, this.brandObjectId, this.nameOfBrandOrCategory ,this.isOffer = false});

}
