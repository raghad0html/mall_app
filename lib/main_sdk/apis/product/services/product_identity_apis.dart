import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/core/servisec/identity/api_identity.dart';
import 'package:mall_app/main_sdk/apis/product/models/product_model.dart';
import 'package:mall_app/main_sdk/apis/product/models/product_params_model.dart';
import 'package:mall_app/main_sdk/enum/http_enum.dart';

class ProductIdentityApi extends ApiModelIdentity {
  Future<ResponseState<ListOfProductModel>> getProduct(
      {required ProductParamsModel productParamsModel}) async {
    return apiMethod('products.php',
        data: productParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => ListOfProductModel.fromJson(json));
  }
}
