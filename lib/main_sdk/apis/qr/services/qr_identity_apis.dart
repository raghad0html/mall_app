import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/core/servisec/identity/api_identity.dart';
import 'package:mall_app/main_sdk/apis/qr/models/qr_model.dart';
import 'package:mall_app/main_sdk/apis/qr/models/qr_params_model.dart';
import 'package:mall_app/main_sdk/enum/http_enum.dart';

class QrIdentityApi extends ApiModelIdentity {
  Future<ResponseState<QrModel>> scanQr(
      {required QrParamsModel qrParamsModel}) async {
    return apiMethod('qr.php',
        data: qrParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => QrModel.fromJson(json));
  }
}
