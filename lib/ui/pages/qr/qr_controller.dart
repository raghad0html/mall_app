import 'package:flutter/material.dart';
import 'package:mall_app/main_sdk/apis/qr/models/qr_params_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../local_storage/shared_prefernce_services.dart';
import '../../../main_sdk/apis/core/models/common/result_class.dart';
import '../../../main_sdk/apis/qr/models/qr_model.dart';
import '../../../main_sdk/apis/qr/models/qr_type_enums_model.dart';
import '../../../main_sdk/apis/qr/services/qr_identity_apis.dart';
import '../../helper/helper.dart';
import '../../widget/video_widget.dart';

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

      if (data.data.stickerAccepted ?? false) {
        switch (data.data.balancePoints) {
          case 2:
            showVideos(2);
            break;
          case 5:
            showVideos(5);
            break;
          case 8:
            showVideos(8);
            break;
          case 12:
            showVideos(12);
            break;
        }
      }
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

  showVideos(points) {
    showGeneralDialog(
      context: state!.context,
      barrierColor: Colors.black12.withOpacity(0.6), // Background color
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(
          milliseconds:
              400), // How long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        return SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InteractiveViewer(
                  panEnabled: true, // Set it to false
                  boundaryMargin: const EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 2,
                  child: AssetVideo(
                    videoName: '$points.mp4',
                  )),
            ],
          ),
        );
      },
    );
  }
}
