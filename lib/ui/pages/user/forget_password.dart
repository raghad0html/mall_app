import 'package:flutter/material.dart';
import 'package:mall_app/routes.dart';
import 'package:mall_app/ui/widget/costume_appbar.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/l10n.dart';
import 'user_controller.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends StateMVC<ForgetPassword> {
  late UserController _con;

  _ForgetPasswordState() : super(UserController()) {
    _con = controller as UserController;
  }

  TextEditingController emailController = TextEditingController();
  // TextEditingController verCodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CostumeAppBar(title: 'إعادة تعيين كلمة المرور'),
            const SizedBox(
              height: 20,
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  !value.contains('@') ||
                                  !value.contains('.')) {
                                return S.of(context).enterEmail;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.resetPasswordScreen);
                                  // _con.loginParamsModel.email =
                                  //     emailController.text;
                                  //
                                  // //TODO
                                  // // _con.loginParamsModel.
                                  // _con.loginUser();
                                },
                                child: const Text(
                                  'أرسال رمز التأكيد',
                                ),
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
