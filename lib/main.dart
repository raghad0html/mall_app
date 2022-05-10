import 'package:flutter/material.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mall_app/local_storage/shared_prefernce_services.dart';
import 'package:mall_app/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorageService.getInstance();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      onGenerateRoute: Routes.getRoutes,
      navigatorKey: navigatorKey,
      initialRoute: Routes.home,
      builder: (context, child) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: child!)));
}
