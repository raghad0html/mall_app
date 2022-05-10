import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/core/servisec/identity/api_identity.dart';
import 'package:mall_app/main_sdk/apis/mall/models/mall_model.dart';
import 'package:mall_app/main_sdk/apis/mall/models/mall_params_model.dart';
import 'package:mall_app/main_sdk/enum/http_enum.dart';

class MallIdentityApi extends ApiModelIdentity {
  Future<ResponseState<ListOfMallModel>> getListBrand(
      MallParamsModel mallParamsModel ) async {
    return apiMethod('mall.php',
        data: mallParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => ListOfMallModel.fromJson(json));
  }
}
