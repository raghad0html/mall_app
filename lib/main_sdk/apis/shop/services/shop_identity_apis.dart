import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/core/servisec/identity/api_identity.dart';
import 'package:mall_app/main_sdk/apis/shop/models/shop_model.dart';
import 'package:mall_app/main_sdk/apis/shop/models/shop_params_model.dart';
import 'package:mall_app/main_sdk/enum/http_enum.dart';

class ShopIdentityApi extends ApiModelIdentity {
  Future<ResponseState<ListOfShopModel>> getShops(
      {required ShopParamsModel shopParamsModel}) async {
    return apiMethod('shop.php',
        data: shopParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => ListOfShopModel.fromJson(json));
  }
}
