import 'package:flutter/material.dart';
import 'package:mall_app/local_storage/shared_prefernce_services.dart';

import '../../../constants/assets.dart';
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
    Future.delayed(const Duration(milliseconds: 900), () {
      var login = LocalStorageService().login ?? false;

      if (login) {
        Navigator.pushReplacementNamed(context, Routes.homeScreen);
      } else {
        Navigator.pushReplacementNamed(context, Routes.loginScreen,
            arguments: BoolArguments(fromLogout: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.assetsLogo,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
