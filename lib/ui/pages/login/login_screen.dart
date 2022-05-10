import 'package:flutter/material.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'user_controller.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

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

  @override
  void dispose() {
    super.dispose();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Image.asset(
                  'assets/images/logo.jpg',
                  width: 200,
                  height: 200,
                ),
                margin: const EdgeInsets.only(top: 50, bottom: 20)),
            Text(
              S.of(context)!.login,
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
                      key: _con.loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: S.of(context)!.email,
                              labelText: S.of(context)!.email,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context)!.enterEmail;
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
                              hintText: S.of(context)!.password,
                              labelText: S.of(context)!.password,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context)!.enterPassword;
                              }
                              return null;
                            },
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
                                child: Text(S.of(context)!.login),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            )
          ],
        ));
  }
}
