import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/core/servisec/identity/api_identity.dart';
import 'package:mall_app/main_sdk/apis/gift/models/assign_randon_gift_to_user_params_model.dart';
import 'package:mall_app/main_sdk/apis/gift/models/get_gift_by_mall_params_model.dart';
import 'package:mall_app/main_sdk/apis/gift/models/gift_model.dart';

import 'package:mall_app/main_sdk/enum/http_enum.dart';

class GiftIdentityApi extends ApiModelIdentity {
  Future<ResponseState<ListOfGiftModel>> getGifts(
      {required GetGiftByMallParamsModel getGiftByMallParamsModel}) async {
    return apiMethod('gifts.php',
        data: getGiftByMallParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => ListOfGiftModel.fromJson(json));
  }

  Future<ResponseState<GiftModel>> getAssingRandomGiftToUser(
      {required AssingRandomGiftToUserParamsModel assingRandomGiftToUserParamsModel}) async {
    return apiMethod('gifts.php',
        data: assingRandomGiftToUserParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => GiftModel.fromJson(json));
  }
}
