import 'package:mall_app/main_sdk/apis/city/models/city_model.dart';
import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/core/servisec/identity/api_identity.dart';

import 'package:mall_app/main_sdk/enum/http_enum.dart';

class CityIdentityApi extends ApiModelIdentity {
  Future<ResponseState<ListOfCityModel>> getCities() async {
    return apiMethod('city.php',
        httpEnum: HttpEnum.post,
        parseJson: (json) => ListOfCityModel.fromJson(json));
  }
}
