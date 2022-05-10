import 'package:flutter/material.dart';
import 'package:mall_app/local_storage/shared_prefernce_services.dart';

import '../../../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800), () {
      var login = LocalStorageService().login ?? false;

      if (login) {
        Navigator.pushNamed(context, Routes.homeScreen);
      } else {
        Navigator.pushNamed(context, Routes.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.jpg',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}