import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mall_app/constants/app_theme.dart';
import 'package:mall_app/generated/l10n.dart';
import 'package:mall_app/local_storage/shared_prefernce_services.dart';
import 'package:mall_app/main_sdk/apis/city/models/city_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/update_profile_params_model.dart';
import 'package:mall_app/main_sdk/apis/user/models/user_model.dart';
import 'package:mall_app/routes.dart';
import 'package:mall_app/ui/pages/user/user_controller.dart';
import 'package:mall_app/ui/shared/widget/custon_dialog_box.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class RemoveAccount extends StatefulWidget {
  //final StringArguments arguments;
  final UserModel userModel;
  final Function(UserModel) onChanged;

  const RemoveAccount(
      {Key? key,
      //required this.arguments,
      required this.userModel,
      required this.onChanged})
      : super(key: key);

  @override
  _RemoveAccountState createState() => _RemoveAccountState();
}

class _RemoveAccountState extends StateMVC<RemoveAccount> {
  late UserController _con;

  _RemoveAccountState() : super(UserController()) {
    _con = controller as UserController;
  }

  TextEditingController codeController = TextEditingController();

  int? cityId;
  String? cityName;
  String? msg;

  deleteAccount() async {
    await _con.deleteAccount();
    msg = _con.msg;
    setState(() {});
  }

  resendDeleteCode() async {
    await _con.resendDeleteCode();
    msg = _con.msg;
    setState(() {});
  }

  verifyDeleteCode() async {
    await _con.verifyDeleteCode(codeController.text);
    msg = _con.msg;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _con.getCity();
    _con.getUserData();
    print("***************************");
    print(LocalStorageService().email);
    //print(widget.arguments.email);
    deleteAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('حذف الحساب'),
        ),
        body: _con.userModel == null
            ? const Center(child: CircularProgressIndicator())
            : Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(17),
                  child: Column(
                    children: [
                      Text(
                        "لتأكيد عملية الحذف",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        msg ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _con.formKey,
                        child: TextFormField(
                          controller: codeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: S.of(context).verificationCode,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).enterVerificationCode;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    //  barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return CustomDialogBox(
                                        title: "هام",
                                        subTitle:
                                            "بإتمامك عملية الحذف, انت توافق على حذف بياناتك والتخلي عن جوائزك وحقوقك المرتبطة بالتطبيق والمسابقة إن وُجدت",
                                        textInButton: "نعم",
                                        color: Colors.red,
                                        textInButton2: "لا",
                                        icon: Icons.info,
                                        lottieIcon: SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: Lottie.asset(
                                                'assets/lottie/alert.json')),
                                        check: false,
                                        callback: () {
                                          verifyDeleteCode();
                                          Navigator.pop(context);
                                        },
                                        callback2: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    });
                              },
                              child: Text(
                                S.of(context).verification,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: AppColors.blackLightColor),
                              onPressed: () {
                                resendDeleteCode();
                              },
                              child: Text(
                                S.of(context).resend,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
  }
}
