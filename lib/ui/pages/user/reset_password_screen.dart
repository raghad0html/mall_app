import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../generated/l10n.dart';
import '../../../routes.dart';
import '../../widget/costume_appbar.dart';
import 'user_controller.dart';

class ResetPasswordScreen extends StatefulWidget {
  final StringArguments arguments;
  const ResetPasswordScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends StateMVC<ResetPasswordScreen> {
  late UserController _con;

  _ResetPasswordScreenState() : super(UserController()) {
    _con = controller as UserController;
  }

  TextEditingController verCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    verCodeController.clear();
    passwordController.clear();
    rePasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CostumeAppBar(title: S.of(context).resetPassword),
              const SizedBox(height: 10),
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
                              height: 20,
                            ),
                            TextFormField(
                              controller: rePasswordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: S.of(context).rewritePassword,
                                labelText: S.of(context).rewritePassword,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  if (value != passwordController.text) {
                                    return S.of(context).passwordMismatch;
                                  }
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
                                    _con.setNewPassword(
                                        email: widget.arguments.email,
                                        code: widget.arguments.code ?? '',
                                        newPassword: passwordController.text);
                                  },
                                  child: Text(S.of(context).resetPassword),
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
          ),
        ));
  }
}
