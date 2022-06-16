
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mall_app/ui/shared/future_builder_widget/lancher.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../constants/app_theme.dart';
import '../../../constants/assets.dart';
import '../../../routes.dart';
import 'user_controller.dart';

class LoginScreen extends StatefulWidget {
  final BoolArguments arguments;
  LoginScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  late UserController _con;

  _LoginScreenState() : super(UserController()) {
    _con = controller as UserController;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DateTime? currentBackPressTime;

  @override
  void dispose() {
    super.dispose();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.arguments.fromLogout) {
          return onWillPop();
        } else {
          return await true;
        }
      },
      child: Scaffold(
          key: _con.scaffoldKey,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Image.asset(
                    Assets.assetsLogo,
                    width: 200,
                    height: 200,
                  ),
                  margin: const EdgeInsets.only(top: 50, bottom: 20)),
              Text(
                S.of(context).login,
                style: Theme.of(context).textTheme.headline6,
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Form(
                        key: _con.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: S.of(context).email,
                                labelText: S.of(context).email,
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.contains('.')) {
                                  return S.of(context).enterEmail;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: S.of(context).password,
                                labelText: S.of(context).password,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).enterPassword;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.forgetPasswordScreen);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: S.of(context).forgetPassword,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: AppColors.basicColor,
                                            fontSize: 12.0,
                                            height: 1
                                            //  decoration: TextDecoration.underline,
                                            ),
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: ' ',
                                      ),
                                      TextSpan(
                                        text: S.of(context).createNewPassword,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                color: AppColors.primaryColor,
                                                fontSize: 12.0,
                                                height: 1
                                                //  decoration: TextDecoration.underline,
                                                ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _con.loginParamsModel.email =
                                        emailController.text;
                                    _con.loginParamsModel.password =
                                        passwordController.text;
                                    _con.loginUser();
                                  },
                                  child: Text(S.of(context).login),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.registerScreen);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: S.of(context).dontHaveAnAccount,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: AppColors.basicColor,
                                            fontSize: 16.0,
                                            height: 1
                                            //  decoration: TextDecoration.underline,
                                            ),
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: ' ',
                                      ),
                                      TextSpan(
                                        text: S.of(context).createNewAccount,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                color: AppColors.primaryColor,
                                                fontSize: 16.0,
                                                height: 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),

                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              )
            ],
          ),
      bottomNavigationBar:   Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'يعني تسجيل الدخول واستخدامك التطبيق موافقتك على ',
                style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .caption!
                        .color),
              ),
              TextSpan(
                  text: 'سياسة الاستخدام',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                  recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      Launcher()
                          .launchInBrowser(
                          Uri.parse(
                              'https://bareeqe.sa/policy/usage/'));
                    }),
              TextSpan(
                text: ' و ',
                style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .caption!
                        .color),
              ),
              TextSpan(
                  text: 'سياسة الخصوصية',
                  style: const TextStyle(
                   fontWeight: FontWeight.bold
                  ),
                  recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      Launcher()
                          .launchInBrowser(
                          Uri.parse(
                              'https://bareeqe.sa/policy/privacy/'));
                    }),
              TextSpan(
                text: ' الخاصة بنا ',
                style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .caption!
                        .color),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(height: 1.5),
        ),
      ),),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: S.of(context).tapAgainToLeave);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
