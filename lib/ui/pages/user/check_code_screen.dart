import 'package:flutter/material.dart';
import 'package:mall_app/ui/pages/user/user_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../constants/app_theme.dart';
import '../../../routes.dart';
import '../../widget/costume_appbar.dart';

class CheckCodeScreen extends StatefulWidget {
  final StringArguments arguments;
  const CheckCodeScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  _CheckCodeScreenState createState() => _CheckCodeScreenState();
}

class _CheckCodeScreenState extends StateMVC<CheckCodeScreen> {
  late UserController _con;

  _CheckCodeScreenState() : super(UserController()) {
    _con = controller as UserController;
  }
  TextEditingController codeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    codeController.clear();
  }

  @override
  void initState() {
    super.initState();
    _con.setTimer();
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'تم إرسال كود التأكيد على بريدك الالكتروني',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              widget.arguments.email,
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: codeController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'كود التأكيد',
                                labelText: 'كود التأكيد',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'يرجى ادخال كود التأكيد';
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
                                    _con.checkCode(widget.arguments.email,
                                        codeController.text);
                                  },
                                  child: const Text(
                                    'تأكيد رمز التأكيد',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  print(_con.clickable);
                                  if (_con.clickable) {
                                    _con.resendCode(widget.arguments.email);
                                  }
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: 'لم يصلك الرمز',
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
                                        text: 'إعادة إرسال الرمز',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                color: AppColors.primaryColor,
                                                fontSize: 16.0,
                                                height: 1
                                                //  decoration: TextDecoration.underline,
                                                ),
                                      ),
                                      TextSpan(
                                        text: ' ${_con.timer} ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                color: AppColors.primaryColor,
                                                fontSize: 16.0,
                                                height: 1
                                                //  decoration: TextDecoration.underline,
                                                ),
                                      ),
                                    ],
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
          ),
        ));
  }
}
