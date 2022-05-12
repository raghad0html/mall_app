import 'package:flutter/material.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../constants/app_theme.dart';
import '../../../constants/assets.dart';
import '../../../main_sdk/apis/mall/models/mall_model.dart';
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
                                    hintText: S.of(context).username,
                                    labelText: S.of(context).username,
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
                                    child: DropdownButton<MallModel>(
                                      hint: const Text("--"),
                                      value: _con.city,
                                      items: _con.cities.map((value) {
                                        return DropdownMenuItem<MallModel>(
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
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _con.loginParamsModel.email =
                                            emailController.text;
                                        _con.loginParamsModel.password =
                                            passwordController.text;
                                        //TODO
                                        // _con.loginParamsModel.
                                        _con.loginUser();
                                      },
                                      child: Text(S.of(context).login),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
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
