import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mall_app/main_sdk/apis/city/models/city_model.dart';
import 'package:mall_app/ui/shared/future_builder_widget/lancher.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../constants/app_theme.dart';
import '../../../constants/assets.dart';
import 'user_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends StateMVC<RegisterScreen> {
  late UserController _con;

  _RegisterScreenState() : super(UserController()) {
    _con = controller as UserController;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  bool check1 = false;

  @override
  void initState() {
    super.initState();
    _con.getCity();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    rePasswordController.clear();
    phoneController.clear();
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
                  Assets.assetsLogo,
                  width: 200,
                  height: 200,
                ),
                margin: const EdgeInsets.only(top: 50, bottom: 20)),
            Text(
              S.of(context).createNewAccount,
              style: Theme.of(context).textTheme.headline6,
            ),
            _con.cities.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
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
                                  controller: nameController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'الاسم الكامل',
                                    labelText: 'الاسم الكامل',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).enterUserName;
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
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
                                TextFormField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: S.of(context).phoneNumber,
                                    labelText: S.of(context).phoneNumber,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S
                                          .of(context)
                                          .pleaseEnterPhoneNumber;
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
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    border:
                                        Border.all(color: AppColors.grayColor),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<CityModel>(
                                      hint: const Text("--"),
                                      value: _con.city,
                                      items: _con.cities.map((value) {
                                        return DropdownMenuItem<CityModel>(
                                          value: value,
                                          child: Text(value.cityName ?? ''),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _con.city = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (!check1) {
                                        check1 = true;
                                      } else {
                                        check1 = false;
                                      }
                                    });
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Checkbox(
                                          value: check1,
                                          onChanged: (check) {
                                            if (check != null)
                                              setState(() {
                                                check1 = check;
                                                if (check1) {
                                                  Launcher().launchInBrowser(
                                                      Uri.parse(
                                                          'https://bareeqe.sa/policy/usage/'));
                                                }
                                              });
                                          }),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'اوافق على ',
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
                                            ],
                                          ),
                                          style: const TextStyle(height: 1.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (check1) {
                                          _con.registerParamsModel.email =
                                              emailController.text;
                                          _con.registerParamsModel.password =
                                              passwordController.text;
                                          _con.registerParamsModel.name =
                                              nameController.text;
                                          _con.registerParamsModel.password =
                                              passwordController.text;
                                          _con.registerParamsModel.cityId =
                                              _con.city.cityId ?? 0;
                                          _con.registerParamsModel.phone =
                                              phoneController.text;
                                          _con.registerNewUser();
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'يرجى الموافقة على سياسة الخصوصية وسياسة الاستخدام ')),
                                          );
                                          return;
                                        }
                                      },
                                      child:
                                          Text(S.of(context).createNewAccount),
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15 ,top: 15),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                          text: S.of(context).iHaveAnAccount,
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
                                              text: S.of(context).login,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .copyWith(
                                                      color:
                                                          AppColors.primaryColor,
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
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'يعني إنشاء حساب لدينا واستخدامك التطبيق موافقتك على ',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .color),
                                      ),
                                      TextSpan(
                                          text: 'سياسة الاستخدام',
                                          style: const TextStyle(
                                            decoration: TextDecoration
                                                .underline,
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
                                            decoration: TextDecoration
                                                .underline,
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
