import 'package:flutter/material.dart';
import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/mall/models/mall_model.dart';
import 'package:mall_app/main_sdk/apis/mall/models/mall_params_model.dart';
import 'package:mall_app/main_sdk/apis/mall/services/mall_identity_apis.dart';
import 'package:mall_app/main_sdk/apis/qr/models/qr_model.dart';
import 'package:mall_app/main_sdk/apis/qr/models/qr_params_model.dart';
import 'package:mall_app/main_sdk/apis/qr/services/qr_identity_apis.dart';
import 'package:mall_app/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:mall_app/ui/shared/widget/custon_dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiIzIn0.3jaQbohqbZ-AFwd7JwkcnzEGOEtabGajYsxSKwFmidA';
  String userId = '3';
  late Future<ResponseState<ListOfMallModel>> _listOfMallModel;

  @override
  void initState() {
    _listOfMallModel = MallIdentityApi().getMalls(
        mallParamsModel: MallParamsModel(
            token: token,
            userid: userId,
            action: 'getMallsByCity',
            cityId: '1'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AppFutureBuilder<ListOfMallModel>(
        future: _listOfMallModel,
        retry: () => MallIdentityApi().getMalls(
            mallParamsModel: MallParamsModel(
                token: token,
                userid: userId,
                action: 'getMallsByCity',
                cityId: '1')),
        whenDone: (data) {
          return Center(
            child: ElevatedButton(
              child: const Text('tab'),
              onPressed: () {
                // MallIdentityApi().getMalls(mallParamsModel: MallParamsModel(token: token, userid: userId ,action: 'getMallsByCity' ,cityId: '1'));

                showDialog(
                    context: context,
                    //  barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AppFutureBuilder<QrModel>(
                        future: QrIdentityApi().scanQr(
                            qrParamsModel: QrParamsModel(
                                qr: 'https://bareeqe.sa/?I3N0aWNrZXIjMzEwMDQ3MDQxMTAwMDAzI0FBQUE=',
                                qrDate: '2022-5-5',
                                mallId: '1',
                                gameId: '1',
                                token: token,
                                userid: userId)),
                        whenError: (error) {
                          return CustomDialogBox(
                            title: "خطأ",
                            subTitle: error!.errorMessage.getErrors,
                            textInButton: "نعم",
                            icon: Icons.error,
                            check: true,
                            callback: () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                        whenDone: (data) {
                          return CustomDialogBox(
                            title: "تهانينا",
                            subTitle: data.msg,
                            icon: Icons.check_circle,
                            textInButton: "ok",
                            check: true,
                            callback: () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      );
                    });
              },
            ),
          );
        },
      ),
    );
  }
}
