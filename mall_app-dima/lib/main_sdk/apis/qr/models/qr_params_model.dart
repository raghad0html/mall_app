import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

import 'qr_type_enums_model.dart';

class QrParamsModel extends AuthModel {
  String qr;
  String qrDate;
  String mallId;
  String gameId;
  QrTypeParamsModel qrType;

  QrParamsModel(
      {required this.qr,
      required this.qrDate,
      required this.mallId,
      required this.gameId,
      required this.qrType,
      required String token,
      required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "qr": qr,
        "game_id": gameId,
        "qrDate": qrDate,
        "mall_id": mallId,
        "qr_type": qrType.toShortString(),
      }..removeWhere((key, value) => value == null);
}
