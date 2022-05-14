import 'package:flutter/material.dart';
import 'package:mall_app/main_sdk/apis/qr/models/qr_params_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../local_storage/shared_prefernce_services.dart';
import '../../../main_sdk/apis/core/models/common/result_class.dart';
import '../../../main_sdk/apis/qr/models/qr_model.dart';
import '../../../main_sdk/apis/qr/models/qr_type_enums_model.dart';
import '../../../main_sdk/apis/qr/services/qr_identity_apis.dart';
import '../../helper/helper.dart';

class QRController extends ControllerMVC {
  late GlobalKey<ScaffoldState> scaffoldKey;
  late OverlayEntry loader;
  bool loading = false;
  int levelIndex = 0;
  QrModel? qrModelResult;

  int targetPoints = 0;
  int balancePoints = 0;
  bool accepted = false;
  QRController() {
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  sendQr(
      {required int mallId,
      required int gameId,
      required String data,
      required QrTypeParamsModel qrType}) async {
    var loader = Helper.overlayLoader(state!.context);
    FocusScope.of(state!.context).unfocus();
    Helper.overlayLoader(state!.context);
    Overlay.of(state!.context)?.insert(loader);
    QrParamsModel qrParamsModel = QrParamsModel(
      qr: data,
      qrDate: DateTime.now().toIso8601String(),
      mallId: mallId.toString(),
      gameId: gameId.toString(),
      token: LocalStorageService().token ?? '',
      userid: LocalStorageService().id ?? '',
      qrType: qrType,
    );
    Helper.hideLoader(loader);

    ResponseState<QrModel> _qrResponse =
        await QrIdentityApi().scanQr(qrParamsModel: qrParamsModel);

    if (_qrResponse is SuccessState) {
      SuccessState<QrModel> data = _qrResponse as SuccessState<QrModel>;
      qrModelResult = data.data;
      accepted = data.data.invoiceAccepted ?? false;
      targetPoints = data.data.targetPoints ?? 0;
      balancePoints = data.data.balancePoints ?? 0;
      setState(() {});
    } else if (_qrResponse is ErrorState) {
      ErrorState<QrModel> data = _qrResponse as ErrorState<QrModel>;
      ScaffoldMessenger.of(state!.context).showSnackBar(SnackBar(
          content: Text(data.errorMessage.error?.message ??
              '') //S.of(state!.context).sorryWeCouldNotFindTheQr),
          ));
    }
  }

  initPoints(
      {required int targetPointsWidget, required int balancePointsWidget}) {
    targetPoints = targetPointsWidget;
    balancePoints = balancePointsWidget;
    setState(() {});
  }
}
